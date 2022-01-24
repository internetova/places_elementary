import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places_elementary/features/init/screens/splash_screen/splash_screen_wm.dart';

/// SplashScreen
class SplashScreen extends ElementaryWidget<ISplashScreenWidgetModel> {
  const SplashScreen({
    Key? key,
    WidgetModelFactory wmFactory = defaultSplashScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(ISplashScreenWidgetModel wm) {
    return const Center(
      child: Text('Сплэш'),
    );
  }
}
