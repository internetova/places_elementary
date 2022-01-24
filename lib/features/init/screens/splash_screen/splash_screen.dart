import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places_elementary/assets/res/app_assets.dart';
import 'package:places_elementary/features/common/constants/app_sizes.dart';
import 'package:places_elementary/features/init/screens/splash_screen/splash_screen_wm.dart';

/// SplashScreen
class SplashScreen extends ElementaryWidget<ISplashScreenWidgetModel> {
  const SplashScreen({
    Key? key,
    WidgetModelFactory wmFactory = defaultSplashScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(ISplashScreenWidgetModel wm) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            wm.yellow,
            wm.green,
          ],
        ),
      ),
      child: Center(
        child: RotationTransition(
          turns: wm.logoAnimation,
          child: SvgPicture.asset(
            AppAssets.icSplashLogo,
            width: AppSizes.splashLogo,
            height: AppSizes.splashLogo,
            color: wm.white,
          ),
        ),
      ),
    );
  }
}
