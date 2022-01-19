import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places_elementary/features/onboarding/screens/onboarding_screen/onboarding_screen_wm.dart';

/// Экран онбординга OnboardingScreen
class OnboardingScreen extends ElementaryWidget<IOnboardingScreenWidgetModel> {
  const OnboardingScreen({
    Key? key,
    WidgetModelFactory wmFactory = defaultOnboardingScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IOnboardingScreenWidgetModel wm) {
    return Container();
  }
}
