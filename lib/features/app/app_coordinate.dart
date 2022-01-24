import 'package:places_elementary/features/app/screens/tabs_screen/tabs_screen.dart';
import 'package:places_elementary/features/debug/screens/debug_screen/debug_screen.dart';
import 'package:places_elementary/features/navigation/domain/entity/coordinate.dart';
import 'package:places_elementary/features/temp/screens/temp_screen/temp_screen.dart';

/// A set of routes for the entire app.
class AppCoordinate implements Coordinate {
  static const initScreen = AppCoordinate._('temp');
  static const debugScreen = AppCoordinate._('debug_screen');
  static const tabsScreen = AppCoordinate._('tabs_screen');

  static const initial = initScreen;

  final String _value;

  const AppCoordinate._(this._value);

  @override
  String toString() => _value;
}

/// List of main routes of the app.
final Map<AppCoordinate, CoordinateBuilder> appCoordinates = {
  AppCoordinate.initial: (_, __) => const TempScreen(),
  AppCoordinate.tabsScreen: (context, data) => const TabsScreen(),
  AppCoordinate.debugScreen: (_, __) => const DebugScreen(),
};
