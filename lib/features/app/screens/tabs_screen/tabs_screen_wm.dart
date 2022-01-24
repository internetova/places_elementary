import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places_elementary/features/app/di/app_scope.dart';
import 'package:places_elementary/features/app/screens/tabs_screen/tabs_screen.dart';
import 'package:places_elementary/features/app/screens/tabs_screen/tabs_screen_model.dart';
import 'package:provider/provider.dart';

/// Контракт для использования на TabsScreen
abstract class ITabsScreenWidgetModel extends IWidgetModel {
  ListenableState<int> get tabState;

  void switchTab(int tabIndex);
}

/// Фабрика для создания виджет модели
TabsScreenWidgetModel defaultTabsScreenWidgetModelFactory(BuildContext context) {
  final appDependencies = context.read<IAppScope>();
  final model = TabsScreenModel(
    appDependencies.errorHandler,
    appDependencies.appSettingsService,
  );

  return TabsScreenWidgetModel(model);
}

/// Виджет модель для MainScreen
class TabsScreenWidgetModel extends WidgetModel<TabsScreen, TabsScreenModel>
    with SingleTickerProviderWidgetModelMixin implements ITabsScreenWidgetModel {
  final _tabState = StateNotifier<int>();

  @override
  ListenableState<int> get tabState => _tabState;

  TabsScreenWidgetModel(TabsScreenModel model) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();

    _init();
  }

  @override
  void switchTab(int tabIndex) {
    _tabState.accept(tabIndex);
    model.setMainTab(tabIndex);
  }

  void _init() {
    final currentTab = model.initData();
    _tabState.accept(currentTab);
  }
}
