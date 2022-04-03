import 'package:flutter/material.dart';
import 'package:places_elementary/features/onboarding/domain/entity/onboarding_item.dart';
import 'package:places_elementary/util/typedefs.dart';

/// Индикатор страниц
class PageIndicator extends StatelessWidget {
  final List<OnboardingItem> data;
  final DataValueChanged<int, Color> getColorIndicator;
  final DataValueChanged<int, double> getWidthIndicator;

  const PageIndicator({
    Key? key,
    required this.data,
    required this.getColorIndicator,
    required this.getWidthIndicator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: data
          .asMap()
          .map(
            (i, element) => MapEntry(
              i,
              Container(
                margin: const EdgeInsets.all(4),
                width: getWidthIndicator(i),
                height: 8,
                decoration: BoxDecoration(
                  color: getColorIndicator(i),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          )
          .values
          .toList(),
    );
  }
}
