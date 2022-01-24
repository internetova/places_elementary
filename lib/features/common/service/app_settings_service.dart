import 'package:elementary/elementary.dart';
import 'package:places_elementary/features/common/domain/entity/app_settings.dart';
import 'package:places_elementary/features/common/domain/repository/shared_prefs_storage.dart';
import 'package:places_elementary/features/places/domain/entity/search_filter.dart';

// TODO(sugina): разнести по отдельным сервисам
/// Настройки приложения:
/// - статус прохождения онбординга
/// - тема приложения
/// - настройки фильтра для отображения мест
/// - текущий таб в нижней навигации
class AppSettingsService {
  final appState = EntityStateNotifier<AppSettings>();
  final SharedPrefsStorage _prefsStorage;
  late AppSettings _appSettings;

  AppSettingsService(this._prefsStorage) {
    init();
  }

  Future<void> init() async {
    appState.loading();

    final themeIsDark = await _prefsStorage.themeIsDark();
    final onboardingIsComplete = await _prefsStorage.onboardingIsComplete();
    final searchFilter = await _prefsStorage.getSearchFilter();
    final mainTab = await _prefsStorage.getMainTab();

    _appSettings = AppSettings(
      themeIsDark: themeIsDark,
      onboardingIsComplete: onboardingIsComplete,
      searchFilter: searchFilter,
      mainTab: mainTab,
    );

    appState.content(_appSettings);
  }

  /// Тема получаем
  Future<void> themeIsDark() async {
    final isDark = await _prefsStorage.themeIsDark();
    _appSettings = _appSettings.copyWith(themeIsDark: isDark);

    appState.content(_appSettings);
  }

  /// Тема сохраняем
  Future<void> setThemeIsDark({required bool isDark}) async {
    _appSettings = _appSettings.copyWith(themeIsDark: isDark);
    appState.content(_appSettings);

    await _prefsStorage.setThemeIsDark(isDark: isDark);
  }

  /// Текущий MainTab нижней навигации
  /// Получаем
  Future<void> getMainTab() async {
    final mainTab = await _prefsStorage.getMainTab();
    _appSettings = _appSettings.copyWith(mainTab: mainTab);

    appState.content(_appSettings);
  }

  /// Сохраняем
  Future<void> setMainTab(int currentTab) async {
    _appSettings = _appSettings.copyWith(mainTab: currentTab);
    appState.content(_appSettings);

    await _prefsStorage.setMainTab(currentTab);
  }

  /// Текущий статус онбординга
  Future<void> onboardingIsComplete() async {
    final isComplete = await _prefsStorage.onboardingIsComplete();
    _appSettings = _appSettings.copyWith(onboardingIsComplete: isComplete);

    appState.content(_appSettings);
  }

  /// Если онбординг пройден сохраним флаг
  Future<void> setOnboardingIsComplete({required bool isComplete}) async {
    _appSettings = _appSettings.copyWith(onboardingIsComplete: isComplete);
    appState.content(_appSettings);

    await _prefsStorage.setOnboardingIsComplete(isComplete: isComplete);
  }

  /// Фильтр получаем
  Future<void> getSearchFilter() async {
    final filter = await _prefsStorage.getSearchFilter();
    _appSettings = _appSettings.copyWith(searchFilter: filter);

    appState.content(_appSettings);
  }

  /// Фильтр сохраняем
  Future<void> setSearchFilter(SearchFilter filter) async {
    _appSettings = _appSettings.copyWith(searchFilter: filter);
    appState.content(_appSettings);

    await _prefsStorage.setSearchFilter(filter);
  }
}
