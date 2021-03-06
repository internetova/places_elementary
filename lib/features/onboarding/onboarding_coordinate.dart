import 'package:places_elementary/features/navigation/domain/entity/coordinate.dart';
import 'package:places_elementary/features/onboarding/screens/onboarding_screen/onboarding_screen.dart';

class OnboardingCoordinate extends Coordinate {
  static const onboardingScreen =
      OnboardingCoordinate._('onboarding_screen', true);

  const OnboardingCoordinate._(
    String value,
    bool isUnique,
  ) : super(
          value: value,
          isUnique: isUnique,
        );
}

final Map<OnboardingCoordinate, CoordinateBuilder> onboardingCoordinates = {
  OnboardingCoordinate.onboardingScreen: (_, __) => const OnboardingScreen(),
};
