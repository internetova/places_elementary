import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places_elementary/features/app/di/app_scope.dart';
import 'package:places_elementary/features/settings/widgets/theme_switch/theme_switch_model.dart';
import 'package:places_elementary/features/settings/widgets/theme_switch/theme_switch_widget.dart';
import 'package:provider/provider.dart';

/// Контракт для ThemeSwitchWidget
abstract class IThemeSwitchWidgetModel extends IWidgetModel {
}

/// Фабрика для создания ThemeSwitchWidgetModel
ThemeSwitchWidgetModel defaultThemeSwitchWidgetModelFactory(BuildContext context) {
  final appDependencies = context.read<IAppScope>();
  final model = ThemeSwitchModel(appDependencies.errorHandler);

  return ThemeSwitchWidgetModel(model);
}

/// Виджет модель для ThemeSwitchWidget
class ThemeSwitchWidgetModel extends WidgetModel<ThemeSwitchWidget, ThemeSwitchModel>
    implements IThemeSwitchWidgetModel {

  ThemeSwitchWidgetModel(ThemeSwitchModel model) : super(model);
}
