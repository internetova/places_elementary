import 'package:elementary/elementary.dart';
import 'package:places_elementary/features/common/domain/entity/app_settings.dart';
import 'package:places_elementary/features/common/service/app_settings_service.dart';

/// Модель для ThemeSwitchWidgetModel
class ThemeSwitchModel extends ElementaryModel {
  final AppSettingsService _appSettingsService;

  ThemeSwitchModel(
    ErrorHandler errorHandler,
    this._appSettingsService,
  ) : super(errorHandler: errorHandler);

  AppSettings? initData() {
    return _appSettingsService.appState.value?.data;
  }

  /// Тема сохраняем
  Future<void> setThemeIsDark({required bool isDark}) async {
    await _appSettingsService.setThemeIsDark(isDark: isDark);
  }
}
