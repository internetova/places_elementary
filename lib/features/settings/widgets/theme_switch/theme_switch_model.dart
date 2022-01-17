import 'package:elementary/elementary.dart';
import 'package:places_elementary/features/settings/service/settings_service.dart';

/// Модель для ThemeSwitchWidgetModel
class ThemeSwitchModel extends ElementaryModel {
  final SettingsService _settingsService;

  ThemeSwitchModel(
    ErrorHandler errorHandler,
    this._settingsService,
  ) : super(errorHandler: errorHandler);

  /// Тема сохраняем
  Future<void> setThemeIsDark({required bool isDark}) =>
      _settingsService.setThemeIsDark(isDark: isDark);

  /// Тема получаем
  Future<bool> themeIsDark() => _settingsService.themeIsDark();
}
