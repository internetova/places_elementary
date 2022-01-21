import 'package:elementary/elementary.dart';
import 'package:places_elementary/features/common/domain/repository/shared_prefs_storage.dart';

/// Настройки приложения:
/// - тема приложения
class SettingsService {
  final themeIsDarkState = EntityStateNotifier<bool>();
  final SharedPrefsStorage _prefsStorage;

  SettingsService(this._prefsStorage) {
    init();
  }

  Future<void> init() async {
    themeIsDarkState.loading();
    final isDark = await _prefsStorage.themeIsDark();
    themeIsDarkState.content(isDark);
  }

  /// Тема получаем
  Future<void> themeIsDark() async {
    final isDark = await _prefsStorage.themeIsDark();
    themeIsDarkState.content(isDark);
  }

  /// Тема сохраняем
  Future<void> setThemeIsDark({required bool isDark}) async {
    themeIsDarkState.content(isDark);
    await _prefsStorage.setThemeIsDark(isDark: isDark);
  }
}
