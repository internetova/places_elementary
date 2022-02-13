import 'package:elementary/elementary.dart';
import 'package:places_elementary/features/common/service/favorites_manager.dart';
import 'package:places_elementary/features/places/domain/entity/favorites_button_type.dart';
import 'package:places_elementary/features/places/domain/entity/place.dart';
import 'package:places_elementary/features/places/service/places_service.dart';

/// Модель для FavoritesButton виджета
class FavoritesButtonModel extends ElementaryModel {
  final PlacesService placesService;
  final FavoritesManager _favoritesManager;

  FavoritesButtonModel(
    ErrorHandler errorHandler,
    this.placesService,
    this._favoritesManager,
  ) : super(errorHandler: errorHandler);

  /// Место избранное?
  bool isFavorite(Place place) => placesService.isFavorite(place);

  /// Добавить в избранные
  void addFavorites(Place place, FavoritesButtonType buttonType) {
    placesService.addFavorites(place);
    _updateIcon(place, buttonType);
    _favoritesManager.updateFavoritesScreen();
  }

  /// Удалить из избранных
  void removeFavorites(Place place, FavoritesButtonType buttonType) {
    placesService.removeFavorites(place);
    _updateIcon(place, buttonType);
    _favoritesManager.updateFavoritesScreen();
  }

  /// Если изменили статус места на экране PlaceDetailsScreen, то на PlacesScreen меняем иконку
  /// этого места на актуальную, т.к. при возвращении не ребилдим экран
  void _updateIcon(Place place, FavoritesButtonType buttonType) {
    if (buttonType == FavoritesButtonType.big) {
      _favoritesManager
        ..updatePlaceIconOnPlacesScreen(place.id)
        ..updateDetails();
    }
  }
}
