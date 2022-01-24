import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:places_elementary/assets/themes/themes.dart';
import 'package:places_elementary/features/common/constants/app_sizes.dart';
import 'package:places_elementary/features/onboarding/domain/entity/onboarding_item.dart';

/// Кнопка Пропустить для онбординга
/// [data] - данные для экрана онбординга
/// [currentPage] - текущая страница онбординга
/// [skipOnboarding] - перейти к приложению пропустив онбординг
/// [buttonAnimation] - настройки анимации скрытия кнопки
class ButtonSkip extends StatelessWidget {
  final List<OnboardingItem> data;
  final int currentPage;
  final VoidCallback skipOnboarding;
  final Animation<double> buttonAnimation;

  const ButtonSkip({
    Key? key,
    required this.data,
    required this.currentPage,
    required this.skipOnboarding,
    required this.buttonAnimation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Если страница последняя скроем кнопку
    final isLastPage = currentPage == data.length - 1;

    final child = Padding(
      padding: const EdgeInsets.all(AppSizes.paddingStandard),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Theme.of(context).colorScheme.green,
          textStyle: Theme.of(context).textTheme.headline5,
        ),
        onPressed: skipOnboarding,
        child: Text(AppLocalizations.of(context)!.onboardingButtonTitleSkip),
      ),
    );

    return isLastPage
        ? FadeTransition(
            opacity: buttonAnimation,
            child: child,
          )
        : child;
  }
}
