import 'package:places_elementary/assets/strings/app_strings.dart';
import 'package:places_elementary/features/common/constants/app_default_values.dart';
import 'package:places_elementary/features/places/domain/entity/search_filter.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Локальное хранилище с использованием SharedPreferences
/// Храним:
/// - статус прохождения онбординга
/// - тему приложения
/// - настройки фильтра для отображения мест
class SharedPrefsStorage {
  SharedPreferences? _prefs;

  /// Тема сохраняем
  Future<void> setThemeIsDark({required bool isDark}) async {
    await _initPrefs();
    await _prefs?.setBool(AppStrings.keyThemeIsDark, isDark);
  }

  /// Тема получаем
  Future<bool> themeIsDark() async {
    await _initPrefs();

    return _prefs?.getBool(AppStrings.keyThemeIsDark) ?? false;
  }

  /// Если онбординг пройден сохраним флаг
  Future<void> setOnboardingIsComplete({required bool isComplete}) async {
    await _initPrefs();
    await _prefs?.setBool(AppStrings.keyOnboardingIsComplete, isComplete);
  }

  /// Текущий статус онбординга
  Future<bool> onboardingIsComplete() async {
    await _initPrefs();

    return _prefs?.getBool(AppStrings.keyOnboardingIsComplete) ?? false;
  }

  /// Фильтр сохраняем
  Future<void> setSearchFilter(SearchFilter filter) async {
    await _initPrefs();

    await _prefs?.setDouble(AppStrings.keyRadius, filter.radius);
    await _prefs?.setStringList(AppStrings.keyTypeFilter, filter.typeFilter);
  }

  /// Фильтр получаем
  Future<SearchFilter> getSearchFilter() async {
    await _initPrefs();

    return SearchFilter(
      radius: _prefs?.getDouble(AppStrings.keyRadius) ?? AppDefaultValues.filterRadius,
      typeFilter:
          _prefs?.getStringList(AppStrings.keyTypeFilter) ?? AppDefaultValues.filterTypesPlaces,
    );
  }

  /// Загружаем и анализируем данные с диска
  Future<void> _initPrefs() async {
    _prefs ??= await SharedPreferences.getInstance();
  }
}
