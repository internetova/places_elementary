import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places_elementary/features/app/di/app_scope.dart';
import 'package:places_elementary/features/main/screens/main_screen/main_screen.dart';
import 'package:places_elementary/features/main/screens/main_screen/main_screen_model.dart';
import 'package:provider/provider.dart';

/// Контракт для использования на MainScreen
abstract class IMainScreenWidgetModel extends IWidgetModel {
  ListenableState<int> get tabState;

  void switchTab(int tabIndex);
}

/// Фабрика для создания виджет модели
MainScreenWidgetModel defaultMainScreenWidgetModelFactory(BuildContext context) {
  final appDependencies = context.read<IAppScope>();
  final model = MainScreenModel(appDependencies.errorHandler);

  return MainScreenWidgetModel(model);
}

/// Виджет модель для MainScreen
class MainScreenWidgetModel extends WidgetModel<MainScreen, MainScreenModel>
    implements IMainScreenWidgetModel {
  final _tabState = StateNotifier<int>(initValue: 0);

  @override
  ListenableState<int> get tabState => _tabState;

  MainScreenWidgetModel(MainScreenModel model) : super(model);

  @override
  void switchTab(int tabIndex) => _tabState.accept(tabIndex);
}
