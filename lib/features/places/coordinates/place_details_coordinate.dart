import 'package:places_elementary/features/navigation/domain/entity/coordinate.dart';
import 'package:places_elementary/features/places/domain/entity/card_type.dart';
import 'package:places_elementary/features/places/domain/entity/place.dart';
import 'package:places_elementary/features/places/screens/place_details_screen/place_details_screen.dart';

class PlaceDetailsCoordinate extends Coordinate {
  static const placeDetailsScreen = PlaceDetailsCoordinate._('place_details_screen', false);

  const PlaceDetailsCoordinate._(
    String value,
    bool isUnique,
  ) : super(
          value: value,
          isUnique: isUnique,
        );
}

final Map<PlaceDetailsCoordinate, CoordinateBuilder> placeDetailsCoordinates = {
  PlaceDetailsCoordinate.placeDetailsScreen: (_, data) => PlaceDetailsScreen(
        place: (data as Map)['place'] as Place,
        transitionFrom: data['transitionFrom'] as CardType,
      ),
};
