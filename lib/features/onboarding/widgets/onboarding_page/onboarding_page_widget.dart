import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places_elementary/features/common/constants/app_sizes.dart';
import 'package:places_elementary/features/onboarding/domain/entity/onboarding_item.dart';
import 'package:places_elementary/features/onboarding/widgets/onboarding_page/onboarding_page_wm.dart';

/// Страница для онбординга
class OnboardingPageWidget extends ElementaryWidget<IOnboardingPageWidgetModel> {
  final OnboardingItem itemData;

  const OnboardingPageWidget({
    Key? key,
    required this.itemData,
    WidgetModelFactory wmFactory = defaultOnboardingPageWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IOnboardingPageWidgetModel wm) {
    return Column(
      children: [
        const Spacer(),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ScaleTransition(
              scale: wm.iconAnimation,
              child: SvgPicture.asset(
                itemData.icon,
                width: 104,
                height: 104,
                color: wm.iconColor,
              ),
            ),
            AppSizes.sizedBoxH40,
            Text(
              itemData.title,
              style: wm.titleStyle,
              textAlign: TextAlign.center,
            ),
            AppSizes.sizedBoxH8,
            Text(
              itemData.text,
              style: wm.textStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 140),
          ],
        ),
        const Spacer(),
      ],
    );
  }
}
