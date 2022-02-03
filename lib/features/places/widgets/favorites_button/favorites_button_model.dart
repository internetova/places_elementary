import 'package:elementary/elementary.dart';
import 'package:places_elementary/features/common/service/favorites_manager.dart';
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
  void addFavorites(Place place) {
    placesService.addFavorites(place);
    _updateScreen();
  }

  /// Удалить из избранных
  void removeFavorites(Place place) {
    placesService.removeFavorites(place);
    _updateScreen();
  }

  /// Обновить экран Избранные
  /// При добавлении / удалении места в избранное с экрана Места роли не играет какие именно это
  /// были места, поэтому просто меняем счетчик кликов для обновления мест из локальной базы данных
  void _updateScreen() {
    final count = _favoritesManager.favoritesState.value;
    _favoritesManager.favoritesState.accept(count! + 1);
  }
}
