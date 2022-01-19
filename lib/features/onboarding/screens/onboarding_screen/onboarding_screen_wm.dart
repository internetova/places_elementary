import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places_elementary/features/app/di/app_scope.dart';
import 'package:places_elementary/features/onboarding/screens/onboarding_screen/onboarding_screen.dart';
import 'package:places_elementary/features/onboarding/screens/onboarding_screen/onboarding_screen_model.dart';
import 'package:provider/provider.dart';

/// Контракт для OnboardingScreen
abstract class IOnboardingScreenWidgetModel extends IWidgetModel {}

/// Фабрика для создания виджет модели
OnboardingScreenWidgetModel defaultOnboardingScreenWidgetModelFactory(BuildContext context) {
  final appDependencies = context.read<IAppScope>();
  final model = OnboardingScreenModel(appDependencies.errorHandler);

  return OnboardingScreenWidgetModel(model);
}

/// Виджет модель для OnboardingScreen
class OnboardingScreenWidgetModel extends WidgetModel<OnboardingScreen, OnboardingScreenModel>
    implements IOnboardingScreenWidgetModel {
  OnboardingScreenWidgetModel(OnboardingScreenModel model) : super(model);
}
