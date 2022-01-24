import 'package:elementary/elementary.dart';
import 'package:places_elementary/features/common/service/app_settings_service.dart';

/// Default Elementary model for SplashScreen module
class SplashScreenModel extends ElementaryModel {
  final AppSettingsService _appSettingsService;

  SplashScreenModel(
    ErrorHandler errorHandler,
    this._appSettingsService,
  ) : super(errorHandler: errorHandler);

  Future<bool> initData() async {
    final isComplete = _appSettingsService.onboardingIsCompleteState.value?.data;

    return isComplete ?? false;
  }
}
