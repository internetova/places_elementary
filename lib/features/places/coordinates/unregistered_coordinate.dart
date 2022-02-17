import 'package:places_elementary/features/navigation/domain/entity/coordinate.dart';
import 'package:places_elementary/features/places/widgets/test_coordinator/unregistered_screen/unregistered_screen.dart';

/// Для теста незарегистрированная координата
class UnregisteredCoordinate extends Coordinate {
  static const unregisteredScreen = UnregisteredCoordinate._('unregistered_screen', true);

  const UnregisteredCoordinate._(
    String value,
    bool isUniqueCoordinate,
  ) : super(
          value: value,
          isUniqueCoordinate: isUniqueCoordinate,
        );
}

final Map<UnregisteredCoordinate, CoordinateBuilder> placeDetailsCoordinates = {
  UnregisteredCoordinate.unregisteredScreen: (_, __) => const UnregisteredScreen(),
};
