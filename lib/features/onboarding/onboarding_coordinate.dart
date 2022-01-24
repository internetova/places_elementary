import 'package:places_elementary/features/navigation/domain/entity/coordinate.dart';
import 'package:places_elementary/features/onboarding/screens/onboarding_screen/onboarding_screen.dart';

class OnboardingCoordinate implements Coordinate {
  static const onboardingScreen = OnboardingCoordinate._('onboarding_screen');

  final String _value;

  const OnboardingCoordinate._(this._value);

  @override
  String toString() => _value;
}

final Map<OnboardingCoordinate, CoordinateBuilder> onboardingCoordinates = {
  OnboardingCoordinate.onboardingScreen: (_, __) => const OnboardingScreen(),
};
