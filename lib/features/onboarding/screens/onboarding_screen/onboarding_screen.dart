import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places_elementary/features/common/constants/app_sizes.dart';
import 'package:places_elementary/features/onboarding/screens/onboarding_screen/onboarding_screen_wm.dart';
import 'package:places_elementary/features/onboarding/widgets/button_skip.dart';
import 'package:places_elementary/features/onboarding/widgets/button_start.dart';
import 'package:places_elementary/features/onboarding/widgets/onboarding_body.dart';

/// Экран онбординга OnboardingScreen
class OnboardingScreen extends ElementaryWidget<IOnboardingScreenWidgetModel> {
  const OnboardingScreen({
    Key? key,
    WidgetModelFactory wmFactory = defaultOnboardingScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IOnboardingScreenWidgetModel wm) {
    return StateNotifierBuilder<int>(
      listenableState: wm.currentPageState,
      builder: (_, page) => Scaffold(
        appBar: AppBar(
          toolbarHeight: AppSizes.toolbarHeightStandard,
          automaticallyImplyLeading: false,
          actions: [
            ButtonSkip(
              data: wm.data,
              currentPage: page ?? 0,
              startApp: wm.goTabsScreen,
              buttonAnimation: wm.buttonSkipAnimation,
            ),
          ],
        ),
        body: OnboardingBody(
          data: wm.data,
          currentPage: page ?? 0,
          pageController: wm.pageController,
          switchPage: wm.switchPage,
        ),
        floatingActionButton: ButtonStart(
          data: wm.data,
          currentPage: page ?? 0,
          startApp: wm.goTabsScreen,
          buttonAnimation: wm.buttonStartAnimation,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        resizeToAvoidBottomInset: false,
      ),
    );
  }
}
