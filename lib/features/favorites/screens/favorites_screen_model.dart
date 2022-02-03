import 'package:elementary/elementary.dart';
import 'package:places_elementary/features/common/service/favorites_manager.dart';
import 'package:places_elementary/features/favorites/domain/entity/favorite.dart';
import 'package:places_elementary/features/favorites/service/favorites_service.dart';
import 'package:places_elementary/features/places/domain/entity/place.dart';

/// Default Elementary model for FavoritesScreen module
class FavoritesScreenModel extends ElementaryModel {
  final FavoritesService _favoritesService;
  final FavoritesManager _favoritesManager;

  FavoritesScreenModel(
    ErrorHandler errorHandler,
    this._favoritesService,
    this._favoritesManager,
  ) : super(errorHandler: errorHandler);

  /// Получить список избранных Планирую
  List<Favorite> getPlannedPlaces() => _favoritesService.getPlannedPlaces();

  /// Получить список избранных Посетил
  List<Favorite> getVisitedPlaces() => _favoritesService.getVisitedPlaces();

  /// Удалить из избранных
  void removeFavorites(Place place) {
    _favoritesService.removeFavorites(place);
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
