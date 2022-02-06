import 'package:places_elementary/features/navigation/domain/entity/coordinate.dart';
import 'package:places_elementary/features/places/domain/entity/place.dart';
import 'package:places_elementary/features/places/screens/place_details_screen/place_details_screen.dart';

class PlaceDetailsCoordinate implements Coordinate {
  static const placeDetailsScreen = PlaceDetailsCoordinate._('place_details_screen');

  final String _value;

  const PlaceDetailsCoordinate._(this._value);

  @override
  String toString() => _value;
}

final Map<PlaceDetailsCoordinate, CoordinateBuilder> placeDetailsCoordinates = {
  PlaceDetailsCoordinate.placeDetailsScreen: (_, data) => PlaceDetailsScreen(
        place: (data as Map)['place'] as Place,
      ),
};
