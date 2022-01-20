import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:places_elementary/features/common/widgets/buttons/button_save.dart';
import 'package:places_elementary/features/onboarding/domain/entity/onboarding_item.dart';

/// Кнопка Старт для онбординга
/// [data] - данные для экрана онбординга
/// [currentPage] - текущая страница онбординга
/// [startApp] - перейти к приложению
/// [buttonAnimation] - настройки анимации показа кнопки
class ButtonStart extends StatelessWidget {
  final List<OnboardingItem> data;
  final int currentPage;
  final VoidCallback startApp;
  final Animation<Offset> buttonAnimation;

  const ButtonStart({
    Key? key,
    required this.data,
    required this.currentPage,
    required this.startApp,
    required this.buttonAnimation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Если страница последняя покажем кнопку
    final isLastPage = currentPage == data.length - 1;

    return isLastPage
        ? SlideTransition(
            position: buttonAnimation,
            child: ButtonSave(
              title: AppLocalizations.of(context)!.onboardingButtonTitleStart.toUpperCase(),
              isButtonEnabled: true,
              onPressed: startApp,
            ),
          )
        : const SizedBox.shrink();
  }
}
