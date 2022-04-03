import 'package:flutter/material.dart';
import 'package:places_elementary/features/common/constants/app_sizes.dart';
import 'package:places_elementary/features/onboarding/domain/entity/onboarding_item.dart';
import 'package:places_elementary/features/onboarding/widgets/onboarding_page/onboarding_page_widget.dart';
import 'package:places_elementary/features/onboarding/widgets/page_indicator.dart';
import 'package:places_elementary/util/typedefs.dart';
import 'package:surf_util/surf_util.dart';

/// Тело онбординга
/// [data] - данные для экрана онбординга
class OnboardingBody extends StatelessWidget {
  final List<OnboardingItem> data;
  final PageController pageController;
  final ValueChanged<int> switchPage;
  final DataValueChanged<int, Color> getColorIndicator;
  final DataValueChanged<int, double> getWidthIndicator;

  const OnboardingBody({
    Key? key,
    required this.data,
    required this.pageController,
    required this.switchPage,
    required this.getColorIndicator,
    required this.getWidthIndicator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final phoneSize = MediaQuery.of(context).size;
    final indicatorPosition = (phoneSize.height - AppSizes.toolbarHeightStandard) / 4;

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
            bottom: indicatorPosition,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: PageIndicator(
                data: data,
                getColorIndicator: getColorIndicator,
                getWidthIndicator: getWidthIndicator,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
