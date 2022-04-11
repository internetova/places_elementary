import 'package:elementary/elementary.dart';
import 'package:places_elementary/features/places/domain/entity/place.dart';
import 'package:places_elementary/features/places/service/places_service.dart';

/// Default Elementary model for PhotoViewScreen module
class PhotoViewScreenModel extends ElementaryModel {
  final PlacesService _placesService;

  PhotoViewScreenModel(
    ErrorHandler errorHandler,
    this._placesService,
  ) : super(errorHandler: errorHandler);

  /// Получить место по id
  Future<Place> getPlaceDetails(int placeId) => _placesService.getPlaceDetails(placeId);
}
