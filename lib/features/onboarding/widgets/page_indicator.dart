import 'package:flutter/material.dart';
import 'package:places_elementary/assets/themes/themes.dart';
import 'package:places_elementary/features/onboarding/domain/entity/onboarding_item.dart';

/// Индикатор страниц
class PageIndicator extends StatefulWidget {
  final List<OnboardingItem> data;
  final int currentPage;

  const PageIndicator({
    Key? key,
    required this.data,
    required this.currentPage,
  }) : super(key: key);

  @override
  State<PageIndicator> createState() => _PageIndicatorState();
}

class _PageIndicatorState extends State<PageIndicator> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: widget.data
          .asMap()
          .map(
            (i, element) => MapEntry(
              i,
              Container(
                margin: const EdgeInsets.all(4),
                width: _getWidth(
                  index: i,
                  currentIndex: widget.currentPage,
                ),
                height: 8,
                decoration: BoxDecoration(
                  color: _getColor(
                    index: i,
                    currentIndex: widget.currentPage,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          )
          .values
          .toList(),
    );
  }

  /// цвет индикатора текущей страницы
  Color _getColor({
    required int index,
    required int currentIndex,
  }) {
    return index == currentIndex
        ? Theme.of(context).colorScheme.green
        : Theme.of(context).colorScheme.inactiveBlack;
  }

  /// ширина индикатора текущей страницы
  double _getWidth({
    required int index,
    required int currentIndex,
  }) {
    return index == currentIndex ? 24 : 8;
  }
}
