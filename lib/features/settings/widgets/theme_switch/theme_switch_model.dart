import 'package:elementary/elementary.dart';
import 'package:places_elementary/features/settings/service/settings_service.dart';

/// Модель для ThemeSwitchWidgetModel
class ThemeSwitchModel extends ElementaryModel {
  final SettingsService _settingsService;

  ThemeSwitchModel(
    ErrorHandler errorHandler,
    this._settingsService,
  ) : super(errorHandler: errorHandler);

  bool? initData() {
    return _settingsService.themeIsDarkState.value?.data;
  }

  /// Тема сохраняем
  Future<void> setThemeIsDark({required bool isDark}) async {
    await _settingsService.setThemeIsDark(isDark: isDark);
  }
}
