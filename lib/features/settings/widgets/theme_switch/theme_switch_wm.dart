import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:places_elementary/assets/themes/themes.dart';
import 'package:places_elementary/features/app/di/app_scope.dart';
import 'package:places_elementary/features/settings/widgets/theme_switch/theme_switch_model.dart';
import 'package:places_elementary/features/settings/widgets/theme_switch/theme_switch_widget.dart';
import 'package:provider/provider.dart';

/// Контракт для ThemeSwitchWidget
abstract class IThemeSwitchWidgetModel extends IWidgetModel {
  String get titleName;

  TextStyle? get titleStyle;

  Color? get trackColor;

  ListenableState<bool> get themeIsDarkState;

  // ignore: avoid_positional_boolean_parameters
  void switchTheme(bool isDark);
}

/// Фабрика для создания ThemeSwitchWidgetModel
ThemeSwitchWidgetModel defaultThemeSwitchWidgetModelFactory(BuildContext context) {
  final appDependencies = context.read<IAppScope>();
  final model = ThemeSwitchModel(
    appDependencies.errorHandler,
    appDependencies.settingsService,
  );

  return ThemeSwitchWidgetModel(model);
}

/// Виджет модель для ThemeSwitchWidget
class ThemeSwitchWidgetModel extends WidgetModel<ThemeSwitchWidget, ThemeSwitchModel>
    implements IThemeSwitchWidgetModel {
  final _themeIsDarkState = StateNotifier<bool>();

  /// Название настройки
  @override
  String get titleName => AppLocalizations.of(context)!.settingThemeDarkTitle;

  /// Стиль названия настройки
  @override
  TextStyle? get titleStyle => Theme.of(context).primaryTextTheme.subtitle1;

  /// Цвет trackColor CupertinoSwitch
  @override
  Color? get trackColor => Theme.of(context).colorScheme.inactiveBlack;

  @override
  ListenableState<bool> get themeIsDarkState => _themeIsDarkState;

  ThemeSwitchWidgetModel(ThemeSwitchModel model) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();

    _init();
  }

  @override
  void switchTheme(bool isDark) {
    model.setThemeIsDark(isDark: isDark);
    _themeIsDarkState.accept(isDark);
  }

  Future<void> _init() async {
    final isDark = await model.themeIsDark();
    _themeIsDarkState.accept(isDark);
  }
}
