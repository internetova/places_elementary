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
    _updateScreen(place);
  }

  /// Обновить экран Избранное
  void _updateScreen(Place place) {
    final count = _favoritesManager.favoritesState.value;
    _favoritesManager.favoritesState.accept(count! + 1);

    /// Для обновления иконки на карточке места на экране Места
    _favoritesManager.removedState.accept(place.id);
  }
}
