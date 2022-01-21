import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:places_elementary/assets/themes/themes.dart';
import 'package:places_elementary/config/app_config.dart';
import 'package:places_elementary/config/debug_options.dart';
import 'package:places_elementary/config/environment/environment.dart';
import 'package:places_elementary/features/app/app_coordinate.dart';
import 'package:places_elementary/features/app/di/app_scope.dart';
import 'package:places_elementary/features/common/widgets/di_scope/di_scope.dart';
import 'package:places_elementary/features/navigation/domain/delegate/app_router_delegate.dart';
import 'package:places_elementary/features/navigation/domain/parser/app_route_information_parses.dart';
import 'package:places_elementary/features/navigation/service/coordinator.dart';
import 'package:places_elementary/features/onboarding/onboarding_coordinate.dart';

/// App widget.
class App extends StatefulWidget {
  /// Create an instance App.
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  late IAppScope _scope;

  @override
  void initState() {
    super.initState();

    _scope = AppScope(applicationRebuilder: _rebuildApplication);

    _setupRouting(_scope.coordinator);
  }

  @override
  Widget build(BuildContext context) {
    return DiScope<IAppScope>(
      key: ObjectKey(_scope),
      factory: () {
        return _scope;
      },
      child: EntityStateNotifierBuilder<bool>(
        listenableEntityState: _scope.settingsService.themeIsDarkState,
        builder: (_, data) => MaterialApp.router(
          /// Localization.
          locale: _localizations.first,
          localizationsDelegates: _localizationsDelegates,
          supportedLocales: _localizations,

          /// Debug configuration.
          showPerformanceOverlay: _getDebugConfig().showPerformanceOverlay,
          debugShowMaterialGrid: _getDebugConfig().debugShowMaterialGrid,
          checkerboardRasterCacheImages: _getDebugConfig().checkerboardRasterCacheImages,
          checkerboardOffscreenLayers: _getDebugConfig().checkerboardOffscreenLayers,
          showSemanticsDebugger: _getDebugConfig().showSemanticsDebugger,
          debugShowCheckedModeBanner: _getDebugConfig().debugShowCheckedModeBanner,

          /// This is for navigation.
          routeInformationParser: AppRouteInformationParser(),
          routerDelegate: AppRouterDelegate(_scope.coordinator),

          /// Тема приложения
          theme: data! ? AppTheme.darkTheme : AppTheme.lightTheme,
        ),
        loadingBuilder: (_, __) => const SizedBox.shrink(),
      ),
    );
  }

  DebugOptions _getDebugConfig() {
    return Environment<AppConfig>.instance().config.debugOptions;
  }

  void _setupRouting(Coordinator coordinator) {
    coordinator
      ..initialCoordinate = AppCoordinate.initial
      ..registerCoordinates('/', appCoordinates)
      ..registerCoordinates('/onboarding', onboardingCoordinates);
  }

  void _rebuildApplication() {
    setState(() {
      _scope = AppScope(applicationRebuilder: _rebuildApplication);
      _setupRouting(_scope.coordinator);
    });
  }
}

// You need to customize for your project.
const _localizations = [Locale('ru', 'RU')];

const _localizationsDelegates = [
  AppLocalizations.delegate,
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
];
