import 'package:elementary/elementary.dart';
import 'package:places_elementary/features/common/service/app_settings_service.dart';

/// Модель для OnboardingScreen
class OnboardingScreenModel extends ElementaryModel {
  final AppSettingsService _appSettingsService;

  OnboardingScreenModel(
    ErrorHandler errorHandler,
    this._appSettingsService,
  ) : super(errorHandler: errorHandler);

  bool onboardingIsComplete() => _appSettingsService.onboardingIsCompleteState.value?.data ?? false;

  /// Сохраняем состояние онбординга
  Future<void> setOnboardingIsComplete({required bool isComplete}) async {
    await _appSettingsService.setOnboardingIsComplete(isComplete: isComplete);
  }
}
