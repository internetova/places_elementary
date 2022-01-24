import 'package:elementary/elementary.dart';
import 'package:places_elementary/features/common/domain/repository/shared_prefs_storage.dart';
import 'package:places_elementary/features/places/domain/entity/search_filter.dart';

/// Настройки приложения:
/// - статус прохождения онбординга
/// - тема приложения
/// - настройки фильтра для отображения мест
/// - текущий таб в нижней навигации
class AppSettingsService {
  final themeIsDarkState = EntityStateNotifier<bool>();
  final onboardingIsCompleteState = EntityStateNotifier<bool>();
  final searchFilterState = EntityStateNotifier<SearchFilter>();
  final tabsState = EntityStateNotifier<int>();

  final SharedPrefsStorage _prefsStorage;

  AppSettingsService(this._prefsStorage) {
    init();
  }

  Future<void> init() async {
    themeIsDarkState.loading();
    final isDark = await _prefsStorage.themeIsDark();
    themeIsDarkState.content(isDark);

    onboardingIsCompleteState.loading();
    final isComplete = await _prefsStorage.onboardingIsComplete();
    onboardingIsCompleteState.content(isComplete);

    searchFilterState.loading();
    final searchFilter = await _prefsStorage.getSearchFilter();
    searchFilterState.content(searchFilter);

    tabsState.loading();
    final mainTab = await _prefsStorage.getMainTab();
    tabsState.content(mainTab);
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

  /// Текущий MainTab нижней навигации
  /// Получаем
  Future<void> getMainTab() async {
    final mainTab = await _prefsStorage.getMainTab();

    tabsState.content(mainTab);
  }

  /// Сохраняем
  Future<void> setMainTab(int currentTab) async {
    tabsState.content(currentTab);

    await _prefsStorage.setMainTab(currentTab);
  }

  /// Текущий статус онбординга
  Future<void> onboardingIsComplete() async {
    final isComplete = await _prefsStorage.onboardingIsComplete();

    onboardingIsCompleteState.content(isComplete);
  }

  /// Если онбординг пройден сохраним флаг
  Future<void> setOnboardingIsComplete({required bool isComplete}) async {
    onboardingIsCompleteState.content(isComplete);

    await _prefsStorage.setOnboardingIsComplete(isComplete: isComplete);
  }

  /// Фильтр получаем
  Future<void> getSearchFilter() async {
    final filter = await _prefsStorage.getSearchFilter();

    searchFilterState.content(filter);
  }

  /// Фильтр сохраняем
  Future<void> setSearchFilter(SearchFilter filter) async {
    searchFilterState.content(filter);

    await _prefsStorage.setSearchFilter(filter);
  }
}
