import 'package:elementary/elementary.dart';
import 'package:places_elementary/features/common/domain/entity/app_settings.dart';
import 'package:places_elementary/features/common/service/app_settings_service.dart';

/// Модель для MainScreen
class MainScreenModel extends ElementaryModel {
  final AppSettingsService _appSettingsService;

  MainScreenModel(
    ErrorHandler errorHandler,
    this._appSettingsService,
  ) : super(errorHandler: errorHandler);

  AppSettings? initData() {
    return _appSettingsService.appState.value?.data;
  }

  /// Сохраняем текущий tab
  Future<void> setMainTab(int currentTab) async {
    await _appSettingsService.setMainTab(currentTab);
  }
}
