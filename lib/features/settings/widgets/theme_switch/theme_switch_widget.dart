import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places_elementary/features/settings/widgets/theme_switch/theme_switch_wm.dart';

/// Виджет экрана настроек - переключение темы
class ThemeSwitchWidget extends ElementaryWidget<IThemeSwitchWidgetModel> {
  const ThemeSwitchWidget({
    Key? key,
    WidgetModelFactory wmFactory = defaultThemeSwitchWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IThemeSwitchWidgetModel wm) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        wm.titleName,
        style: wm.titleStyle,
      ),
      trailing: StateNotifierBuilder<bool>(
        listenableState: wm.themeIsDarkState,
        builder: (_, data) => CupertinoSwitch(
          trackColor: wm.trackColor,
          value: data ?? false,
          onChanged: wm.switchTheme,
        ),
      ),
    );
  }
}
