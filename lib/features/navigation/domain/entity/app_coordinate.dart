import 'package:places_elementary/features/debug/screens/debug_screen/debug_screen.dart';
import 'package:places_elementary/features/favorites/screens/favorites_screen.dart';
import 'package:places_elementary/features/main/screens/main_screen/main_screen.dart';
import 'package:places_elementary/features/map/screens/map_screen.dart';
import 'package:places_elementary/features/navigation/domain/entity/coordinate.dart';
import 'package:places_elementary/features/onboarding/screens/onboarding_screen/onboarding_screen.dart';
import 'package:places_elementary/features/places/screens/places_screen/places_screen.dart';
import 'package:places_elementary/features/settings/screens/settings_screen.dart';
import 'package:places_elementary/features/temp/screens/temp_screen/temp_screen.dart';

/// A set of routes for the entire app.
class AppCoordinate implements Coordinate {
  /// Initialization screens ([TempScreen]).
  static const initScreen = AppCoordinate._('temp');

  /// Debug screens ([DebugScreen]).
  static const debugScreen = AppCoordinate._('debug_screen');

  /// Главный экран ([MainScreen]).
  static const mainScreen = AppCoordinate._('main_screen');

  /// Список мест ([PlacesScreen]).
  static const placesScreen = AppCoordinate._('places_screen');

  /// Места на карте ([MapScreen]).
  static const mapScreen = AppCoordinate._('map_screen');

  /// Избранное ([FavoritesScreen]).
  static const favoritesScreen = AppCoordinate._('favorites_screen');

  /// Настройки ([SettingsScreen]).
  static const settingsScreen = AppCoordinate._('settings_screen');

  /// Онбординг ([OnboardingScreen]).
  static const onboardingScreen = AppCoordinate._('onboarding_screen');

  /// Initialization screens(it can be any screens).
  static const initial = initScreen;

  final String _value;

  const AppCoordinate._(this._value);

  @override
  String toString() => _value;
}

/// List of main routes of the app.
final Map<AppCoordinate, CoordinateBuilder> appCoordinates = {
  AppCoordinate.initial: (_, __) => const TempScreen(),
  AppCoordinate.debugScreen: (_, __) => const DebugScreen(),
  AppCoordinate.mainScreen: (_, __) => const MainScreen(),
  AppCoordinate.placesScreen: (_, __) => const PlacesScreen(),
  AppCoordinate.mapScreen: (_, __) => const MapScreen(),
  AppCoordinate.favoritesScreen: (_, __) => const FavoritesScreen(),
  AppCoordinate.settingsScreen: (_, __) => const SettingsScreen(),
  AppCoordinate.onboardingScreen: (_, __) => const OnboardingScreen(),
};
