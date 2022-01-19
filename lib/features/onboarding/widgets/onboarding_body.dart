import 'package:flutter/material.dart';
import 'package:places_elementary/features/onboarding/domain/entity/onboarding_item.dart';
import 'package:places_elementary/features/onboarding/widgets/onboarding_page/onboarding_page_widget.dart';
import 'package:places_elementary/features/onboarding/widgets/page_indicator.dart';
import 'package:surf_util/surf_util.dart';

/// Тело онбординга
/// [data] - данные для экрана онбординга
/// [currentPage] - текущая страница онбординга
class OnboardingBody extends StatelessWidget {
  final List<OnboardingItem> data;
  final int currentPage;
  final PageController pageController;
  final ValueChanged<int> switchPage;

  const OnboardingBody({
    Key? key,
    required this.data,
    required this.currentPage,
    required this.pageController,
    required this.switchPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DisableOverscroll(
      child: Stack(
        children: [
          PageView.builder(
            onPageChanged: switchPage,
            controller: pageController,
            itemCount: data.length,
            itemBuilder: (_, index) => OnboardingPageWidget(itemData: data[index]),
          ),
          Positioned.fill(
            bottom: 100,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: PageIndicator(
                data: data,
                currentPage: currentPage,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
