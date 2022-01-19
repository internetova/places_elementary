import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places_elementary/features/app/di/app_scope.dart';
import 'package:places_elementary/features/common/constants/app_sizes.dart';
import 'package:places_elementary/features/onboarding/widgets/onboarding_page/onboarding_page_model.dart';
import 'package:places_elementary/features/onboarding/widgets/onboarding_page/onboarding_page_widget.dart';
import 'package:provider/provider.dart';

/// Контракт для OnboardingPageWidget
abstract class IOnboardingPageWidgetModel extends IWidgetModel {
  AnimationController get animationController;

  Animation<double> get iconAnimation;

  TextStyle? get titleStyle;

  TextStyle? get textStyle;

  Color? get iconColor;
}

/// Фабрика для создания виджет модели
OnboardingPageWidgetModel defaultOnboardingPageWidgetModelFactory(BuildContext context) {
  final appDependencies = context.read<IAppScope>();
  final model = OnboardingPageModel(appDependencies.errorHandler);

  return OnboardingPageWidgetModel(model);
}

/// Виджет модель для OnboardingPageWidget
class OnboardingPageWidgetModel extends WidgetModel<OnboardingPageWidget, OnboardingPageModel>
    with SingleTickerProviderWidgetModelMixin
    implements IOnboardingPageWidgetModel {
  late final AnimationController _animationController;
  late final Animation<double> _iconAnimation;

  @override
  AnimationController get animationController => _animationController;

  @override
  Animation<double> get iconAnimation => _iconAnimation;

  @override
  TextStyle? get titleStyle => Theme.of(context).textTheme.headline4!.copyWith(
        color: Theme.of(context).colorScheme.primary,
      );

  @override
  TextStyle? get textStyle => Theme.of(context).textTheme.bodyText2;

  @override
  Color? get iconColor => Theme.of(context).colorScheme.primary;

  OnboardingPageWidgetModel(OnboardingPageModel model) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();

    _animationController = AnimationController(
      vsync: this,
      duration: AppSizes.milliseconds700,
    );

    _iconAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
