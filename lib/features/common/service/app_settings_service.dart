import 'package:places_elementary/features/common/domain/repository/shared_prefs_storage.dart';
import 'package:places_elementary/features/places/domain/entity/search_filter.dart';

/// Настройки приложения:
/// - статус прохождения онбординга
/// - тема приложения
/// - настройки фильтра для отображения мест
class AppSettingsService {
  final SharedPrefsStorage prefsStorage;

  AppSettingsService(this.prefsStorage);

  /// Тема сохраняем
  Future<void> setThemeIsDark({required bool isDark}) =>
      prefsStorage.setThemeIsDark(isDark: isDark);

  /// Тема получаем
  Future<bool> themeIsDark() => prefsStorage.themeIsDark();

  /// Если онбординг пройден сохраним флаг
  Future<void> setOnboardingIsComplete({required bool isComplete}) =>
      prefsStorage.setOnboardingIsComplete(isComplete: isComplete);

  /// Текущий статус онбординга
  Future<bool> onboardingIsComplete() => prefsStorage.onboardingIsComplete();

  /// Фильтр сохраняем
  Future<void> setSearchFilter(SearchFilter filter) => prefsStorage.setSearchFilter(filter);

  /// Фильтр получаем
  Future<SearchFilter> getSearchFilter() => prefsStorage.getSearchFilter();
}
