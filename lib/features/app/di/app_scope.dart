import 'dart:ui';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:elementary/elementary.dart';
import 'package:places_elementary/api/service/places_api.dart';
import 'package:places_elementary/config/app_config.dart';
import 'package:places_elementary/config/environment/environment.dart';
import 'package:places_elementary/features/common/domain/repository/shared_prefs_storage.dart';
import 'package:places_elementary/features/common/service/app_settings_service.dart';
import 'package:places_elementary/features/navigation/service/coordinator.dart';
import 'package:places_elementary/features/places/domain/repository/places_repository.dart';
import 'package:places_elementary/features/places/service/places_service.dart';
import 'package:places_elementary/util/default_error_handler.dart';

/// Scope of dependencies which need through all app's life.
class AppScope implements IAppScope {
  late final Dio _dio;
  late final ErrorHandler _errorHandler;
  late final VoidCallback _applicationRebuilder;
  late final Coordinator _coordinator;
  late final SharedPrefsStorage _prefsStorage;

  /// Настройки
  late final AppSettingsService _appSettingsService;

  /// Места
  late final PlacesApi _placesApi;
  late final PlacesRepository _placesRepository;
  late final PlacesService _placesService;

  @override
  Dio get dio => _dio;

  @override
  ErrorHandler get errorHandler => _errorHandler;

  @override
  VoidCallback get applicationRebuilder => _applicationRebuilder;

  @override
  Coordinator get coordinator => _coordinator;

  @override
  AppSettingsService get appSettingsService => _appSettingsService;

  @override
  PlacesService get placesService => _placesService;

  /// Create an instance [AppScope].
  AppScope({
    required VoidCallback applicationRebuilder,
  }) : _applicationRebuilder = applicationRebuilder {
    /// List interceptor. Fill in as needed.
    final additionalInterceptors = <Interceptor>[];

    _dio = _initDio(additionalInterceptors);
    _errorHandler = DefaultErrorHandler();
    _coordinator = Coordinator();
    _prefsStorage = SharedPrefsStorage();

    _appSettingsService = _initAppSettingsService(_prefsStorage);
    _placesService = _initPlacesService(_dio);
  }

  Dio _initDio(Iterable<Interceptor> additionalInterceptors) {
    const timeout = Duration(seconds: 30);

    final dio = Dio();

    dio.options
      ..baseUrl = Environment<AppConfig>.instance().config.url
      ..connectTimeout = timeout.inMilliseconds
      ..receiveTimeout = timeout.inMilliseconds
      ..sendTimeout = timeout.inMilliseconds;

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
      final proxyUrl = Environment<AppConfig>.instance().config.proxyUrl;
      if (proxyUrl != null && proxyUrl.isNotEmpty) {
        client
          ..findProxy = (uri) {
            return 'PROXY $proxyUrl';
          }
          ..badCertificateCallback = (_, __, ___) {
            return true;
          };
      }
    };

    dio.interceptors.addAll(additionalInterceptors);

    if (Environment<AppConfig>.instance().isDebug) {
      dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    }

    return dio;
  }

  /// Работа с настройками приложения
  AppSettingsService _initAppSettingsService(SharedPrefsStorage storage) {
    return AppSettingsService(storage);
  }

  /// Работа с местами
  PlacesService _initPlacesService(Dio dio) {
    _placesApi = PlacesApi(dio);
    _placesRepository = PlacesRepository(_placesApi);

    return PlacesService(_placesRepository);
  }
}

/// App dependencies.
abstract class IAppScope {
  /// Http client.
  Dio get dio;

  /// Interface for handle error in business logic.
  ErrorHandler get errorHandler;

  /// Callback to rebuild the whole application.
  VoidCallback get applicationRebuilder;

  /// Class that coordinates navigation for the whole app.
  Coordinator get coordinator;

  /// Сервис для работы с настройками
  AppSettingsService get appSettingsService;

  /// Сервис для работы с местами
  PlacesService get placesService;
}
