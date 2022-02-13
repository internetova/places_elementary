import 'package:elementary/elementary.dart';
import 'package:places_elementary/features/common/service/favorites_manager.dart';
import 'package:places_elementary/features/favorites/service/favorites_service.dart';
import 'package:places_elementary/features/places/domain/entity/place.dart';

/// Модель для RemoveFavoritesButton виджета
class RemoveFavoritesButtonModel extends ElementaryModel {
  final FavoritesService favoritesService;
  final FavoritesManager _favoritesManager;

  RemoveFavoritesButtonModel(
    ErrorHandler errorHandler,
    this.favoritesService,
    this._favoritesManager,
  ) : super(errorHandler: errorHandler);

  /// Удалить из избранных
  void removeFavorites(Place place) {
    favoritesService.removeFavorites(place);
    _favoritesManager
      ..updateFavoritesScreen()
      ..updatePlaceIconOnPlacesScreen(place.id);
  }
}
