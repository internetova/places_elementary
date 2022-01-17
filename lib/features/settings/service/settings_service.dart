import 'package:places_elementary/features/common/domain/repository/shared_prefs_storage.dart';

class SettingsService {
  final SharedPrefsStorage prefsStorage;

  SettingsService(this.prefsStorage);

  /// Тема сохраняем
  Future<void> setThemeIsDark({required bool isDark}) =>
      prefsStorage.setThemeIsDark(isDark: isDark);

  /// Тема получаем
  Future<bool> themeIsDark() => prefsStorage.themeIsDark();

}