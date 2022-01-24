import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places_elementary/assets/themes/themes.dart';
import 'package:places_elementary/features/app/app_coordinate.dart';
import 'package:places_elementary/features/app/di/app_scope.dart';
import 'package:places_elementary/features/common/constants/app_sizes.dart';
import 'package:places_elementary/features/init/screens/splash_screen/splash_screen.dart';
import 'package:places_elementary/features/init/screens/splash_screen/splash_screen_model.dart';
import 'package:places_elementary/features/navigation/service/coordinator.dart';
import 'package:places_elementary/features/onboarding/onboarding_coordinate.dart';
import 'package:provider/provider.dart';

/// Контракт для SplashScreen
abstract class ISplashScreenWidgetModel extends IWidgetModel {
  Animation<double> get logoAnimation;

  Color get yellow;

  Color get green;

  Color get white;
}

/// Фабрика для создания виджет модели
SplashScreenWidgetModel defaultSplashScreenWidgetModelFactory(BuildContext context) {
  final appDependencies = context.read<IAppScope>();
  final model = SplashScreenModel(
    appDependencies.errorHandler,
    appDependencies.appSettingsService,
  );
  final coordinator = appDependencies.coordinator;

  return SplashScreenWidgetModel(model, coordinator);
}

/// Виджет модель для SplashScreenWidget
class SplashScreenWidgetModel extends WidgetModel<SplashScreen, SplashScreenModel>
    with TickerProviderWidgetModelMixin
    implements ISplashScreenWidgetModel {
  final Coordinator coordinator;

  /// Анимация логотипа
  late final AnimationController _animationController;
  late final Animation<double> _logoAnimation;

  @override
  Animation<double> get logoAnimation => _logoAnimation;

  @override
  Color get yellow => Theme.of(context).colorScheme.yellow2;

  @override
  Color get green => Theme.of(context).colorScheme.green2;

  @override
  Color get white => Colors.white;

  SplashScreenWidgetModel(
    SplashScreenModel model,
    this.coordinator,
  ) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();

    _init();

    _animationController = AnimationController(
      vsync: this,
      duration: AppSizes.milliseconds1500,
    );

    _logoAnimation = Tween<double>(
      begin: 0,
      end: -1,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void goOnboardingScreen() {
    coordinator.navigate(
      context,
      OnboardingCoordinate.onboardingScreen,
      replaceRootCoordinate: true,
    );
  }

  void goTabsScreen() {
    coordinator.navigate(
      context,
      AppCoordinate.tabsScreen,
      replaceRootCoordinate: true,
    );
  }

  Future<void> _init() async {
    final isComplete = await model.initData();

    await Future<void>.delayed(AppSizes.seconds3);

    if (isComplete) {
      goTabsScreen();
    } else {
      goOnboardingScreen();
    }
  }
}
