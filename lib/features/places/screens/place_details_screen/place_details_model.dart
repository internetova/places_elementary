import 'package:elementary/elementary.dart';
import 'package:places_elementary/features/favorites/domain/entity/favorite.dart';
import 'package:places_elementary/features/favorites/service/favorites_service.dart';
import 'package:places_elementary/features/places/domain/entity/place.dart';
import 'package:places_elementary/features/places/service/places_service.dart';

/// Default Elementary model for PlaceDetailsScreen module
class PlaceDetailsModel extends ElementaryModel {
  final PlacesService _placesService;
  final FavoritesService _favoritesService;

  PlaceDetailsModel(
    ErrorHandler errorHandler,
    this._placesService,
    this._favoritesService,
  ) : super(errorHandler: errorHandler);

  /// Получить место по id
  Future<Place> getPlaceDetails(int placeId) => _placesService.getPlaceDetails(placeId);

  /// Место избранное?
  bool isFavorite(Place place) => _placesService.isFavorite(place);

  /// Получить избранное место
  Favorite getFavorite(int id) => _favoritesService.getFavorite(id);

  /// Удалить из избранных
  void removeFavorites(Place place) => _favoritesService.removeFavorites(place);

  /// Установить дату и время посещения места
  void setReminder(Favorite favorite) => _favoritesService.setReminder(favorite);
}
