import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places_elementary/assets/res/app_assets.dart';
import 'package:places_elementary/features/settings/widgets/onboarding/setting_onboarding_wm.dart';

/// Виджет экрана настроек - Онбординг
class SettingOnboardingWidget extends ElementaryWidget<ISettingOnboardingWidgetModel> {
  const SettingOnboardingWidget({
    Key? key,
    WidgetModelFactory wmFactory = defaultSettingOnboardingWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(ISettingOnboardingWidgetModel wm) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        wm.titleName,
        style: wm.titleStyle,
      ),
      trailing: IconButton(
        icon: SvgPicture.asset(
          AppAssets.icInfo,
          color: wm.buttonColor,
        ),
        onPressed: wm.goOnboardingScreen,
      ),
    );
  }
}
