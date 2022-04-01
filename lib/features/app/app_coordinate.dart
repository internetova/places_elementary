import 'package:places_elementary/features/app/screens/tabs_screen/tabs_screen.dart';
import 'package:places_elementary/features/debug/screens/debug_screen/debug_screen.dart';
import 'package:places_elementary/features/init/screens/splash_screen/splash_screen.dart';
import 'package:places_elementary/features/navigation/domain/entity/coordinate.dart';

/// A set of routes for the entire app.
class AppCoordinate extends Coordinate {
  static const initScreen = AppCoordinate._('splash_screen', true);
  static const debugScreen = AppCoordinate._('debug_screen', true);
  static const tabsScreen = AppCoordinate._('tabs_screen', true);

  static const initial = initScreen;

  const AppCoordinate._(
    String value,
    bool isUnique,
  ) : super(
          value: value,
          isUnique: isUnique,
        );
}

/// List of main routes of the app.
final Map<AppCoordinate, CoordinateBuilder> appCoordinates = {
  AppCoordinate.initial: (_, __) => const SplashScreen(),
  AppCoordinate.tabsScreen: (context, data) => const TabsScreen(),
  AppCoordinate.debugScreen: (_, __) => const DebugScreen(),
};
