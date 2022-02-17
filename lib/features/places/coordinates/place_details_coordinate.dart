import 'package:places_elementary/features/navigation/domain/entity/coordinate.dart';
import 'package:places_elementary/features/places/domain/entity/place.dart';
import 'package:places_elementary/features/places/screens/place_details_screen/place_details_screen.dart';
import 'package:places_elementary/features/places/widgets/test_coordinator/unique_screen/unique_screen.dart';

class PlaceDetailsCoordinate extends Coordinate {
  static const placeDetailsScreen = PlaceDetailsCoordinate._('place_details_screen', false);
  static const uniqueScreen = PlaceDetailsCoordinate._('unique_screen', true);

  const PlaceDetailsCoordinate._(
    String value,
    bool isUniqueCoordinate,
  ) : super(
          value: value,
          isUniqueCoordinate: isUniqueCoordinate,
        );
}

final Map<PlaceDetailsCoordinate, CoordinateBuilder> placeDetailsCoordinates = {
  PlaceDetailsCoordinate.placeDetailsScreen: (_, data) => PlaceDetailsScreen(
        place: (data as Map)['place'] as Place,
      ),
  PlaceDetailsCoordinate.uniqueScreen: (_, __) => const UniqueScreen(),
};
