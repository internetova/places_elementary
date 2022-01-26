import 'package:elementary/elementary.dart';
import 'package:places_elementary/features/places/domain/entity/place.dart';
import 'package:places_elementary/features/places/service/places_service.dart';

/// Модель для FavoritesButton виджета
class FavoritesButtonModel extends ElementaryModel {
  final PlacesService placesService;

  FavoritesButtonModel(
    ErrorHandler errorHandler,
    this.placesService,
  ) : super(errorHandler: errorHandler);

  /// Место избранное?
  bool isFavorite(Place place) => placesService.isFavorite(place);

  /// Добавить в избранные
  void addFavorites(Place place) => placesService.addFavorites(place);

  /// Удалить из избранных
  void removeFavorites(Place place) => placesService.removeFavorites(place);
}
