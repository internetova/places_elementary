import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:places_elementary/assets/res/app_assets.dart';
import 'package:places_elementary/assets/themes/themes.dart';
import 'package:places_elementary/features/app/app_coordinate.dart';
import 'package:places_elementary/features/app/di/app_scope.dart';
import 'package:places_elementary/features/common/constants/app_sizes.dart';
import 'package:places_elementary/features/navigation/service/coordinator.dart';
import 'package:places_elementary/features/onboarding/domain/entity/onboarding_item.dart';
import 'package:places_elementary/features/onboarding/screens/onboarding_screen/onboarding_screen.dart';
import 'package:places_elementary/features/onboarding/screens/onboarding_screen/onboarding_screen_model.dart';
import 'package:provider/provider.dart';

/// Контракт для OnboardingScreen
abstract class IOnboardingScreenWidgetModel extends IWidgetModel {
  /// Данные для экрана онбординга
  List<OnboardingItem> get data;

  ListenableState<int> get currentPageState;

  PageController get pageController;

  Animation<Offset> get buttonStartAnimation;

  Animation<double> get buttonSkipAnimation;

  void switchPage(int pageIndex);

  Color getColorIndicator(int indicatorIndex);

  double getWidthIndicator(int indicatorIndex);

  void skipOnboarding();

  void startApp();
}

/// Фабрика для создания виджет модели
OnboardingScreenWidgetModel defaultOnboardingScreenWidgetModelFactory(BuildContext context) {
  final appDependencies = context.read<IAppScope>();
  final model = OnboardingScreenModel(
    appDependencies.errorHandler,
    appDependencies.appSettingsService,
  );
  final coordinator = appDependencies.coordinator;

  return OnboardingScreenWidgetModel(model, coordinator);
}

/// Виджет модель для OnboardingScreen
class OnboardingScreenWidgetModel extends WidgetModel<OnboardingScreen, OnboardingScreenModel>
    with SingleTickerProviderWidgetModelMixin
    implements IOnboardingScreenWidgetModel {
  final Coordinator coordinator;

  /// Текущая страница онбординга
  final _currentPageState = StateNotifier<int>(initValue: 0);
  final _pageController = PageController();

  late final AnimationController _animationController;

  /// Параметры анимации для кнопок
  late final Animation<Offset> _buttonStartAnimation;
  late final Animation<double> _buttonSkipAnimation;

  /// Данные для онбординга
  @override
  List<OnboardingItem> get data => [
        OnboardingItem(
          icon: AppAssets.icPage1,
          title: AppLocalizations.of(context)!.onboardingItemOneTitle,
          text: AppLocalizations.of(context)!.onboardingItemOneText,
        ),
        OnboardingItem(
          icon: AppAssets.icPage2,
          title: AppLocalizations.of(context)!.onboardingItemTwoTitle,
          text: AppLocalizations.of(context)!.onboardingItemTwoText,
        ),
        OnboardingItem(
          icon: AppAssets.icPage3,
          title: AppLocalizations.of(context)!.onboardingItemThreeTitle,
          text: AppLocalizations.of(context)!.onboardingItemThreeText,
        ),
      ];

  @override
  ListenableState<int> get currentPageState => _currentPageState;

  @override
  PageController get pageController => _pageController;

  @override
  Animation<Offset> get buttonStartAnimation => _buttonStartAnimation;

  @override
  Animation<double> get buttonSkipAnimation => _buttonSkipAnimation;

  OnboardingScreenWidgetModel(
    OnboardingScreenModel model,
    this.coordinator,
  ) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();

    _animationController = AnimationController(
      vsync: this,
      duration: AppSizes.milliseconds700,
    );

    _buttonStartAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );

    _buttonSkipAnimation = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInBack,
      ),
    );

    _currentPageState.addListener(_playAnimation);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void switchPage(int pageIndex) {
    _currentPageState.accept(pageIndex);
  }

  /// Цвет индикатора текущей страницы
  @override
  Color getColorIndicator(int indicatorIndex) {
    return indicatorIndex == _currentPageState.value!
        ? Theme.of(context).colorScheme.green
        : Theme.of(context).colorScheme.inactiveBlack;
  }

  /// Ширина индикатора текущей страницы
  @override
  double getWidthIndicator(int indicatorIndex) {
    return indicatorIndex == _currentPageState.value! ? 24 : 8;
  }

  @override
  void skipOnboarding() {
    _goTabsScreen();
  }

  @override
  void startApp() {
    /// Если онбординг еще не проходили, то поставим флаг о прохождении
    final isComplete = model.onboardingIsComplete();

    if (!isComplete) {
      model.setOnboardingIsComplete(isComplete: true);
    }

    _goTabsScreen();
  }

  void _goTabsScreen() {
    coordinator.navigate(
      context,
      AppCoordinate.tabsScreen,
      replaceRootCoordinate: true,
    );
  }

  /// Запуск анимации кнопок
  void _playAnimation() {
    if (_currentPageState.value == data.length - 1) {
      _animationController.forward();
    } else {
      _animationController.reset();
    }
  }
}
