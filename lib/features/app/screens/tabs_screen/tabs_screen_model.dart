import 'package:elementary/elementary.dart';
import 'package:places_elementary/features/app/service/tabs_service.dart';

/// Модель для TabsScreen
class TabsScreenModel extends ElementaryModel {
  final TabsService _tabsService;

  TabsScreenModel(
    ErrorHandler errorHandler,
    this._tabsService,
  ) : super(errorHandler: errorHandler);

  int? initData() {
    return _tabsService.tabsState.value?.data;
  }

  /// Сохраняем текущий tab
  Future<void> setMainTab(int currentTab) async {
    await _tabsService.setMainTab(currentTab);
  }
}
