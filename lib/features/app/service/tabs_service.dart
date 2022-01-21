import 'package:elementary/elementary.dart';
import 'package:places_elementary/features/common/domain/repository/shared_prefs_storage.dart';

/// Переключение табов
/// - текущий таб в нижней навигации
class TabsService {
  final tabsState = EntityStateNotifier<int>();
  final SharedPrefsStorage _prefsStorage;

  TabsService(this._prefsStorage) {
    init();
  }

  Future<void> init() async {
    tabsState.loading();
    final mainTab = await _prefsStorage.getMainTab();
    tabsState.content(mainTab);
  }

  /// Текущий Tab нижней навигации
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
}
