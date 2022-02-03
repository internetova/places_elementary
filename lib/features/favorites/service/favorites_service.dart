import 'package:places_elementary/features/common/domain/repository/i_local_storage.dart';
import 'package:places_elementary/features/favorites/domain/entity/favorite.dart';
import 'package:places_elementary/features/favorites/domain/entity/favorite_type.dart';
import 'package:places_elementary/features/places/domain/entity/place.dart';

/// Сервис для работы с избранными местами
/// [ILocalStorage] - сейчас ObjectboxStorage
class FavoritesService {
  final ILocalStorage _localStorage;

  FavoritesService(this._localStorage);

  /// Получить список избранных Планирую
  List<Favorite> getPlannedPlaces() => _localStorage.getFavoritesPlaces(FavoriteType.planned);

  /// Получить список избранных Посетил
  List<Favorite> getVisitedPlaces() => _localStorage.getFavoritesPlaces(FavoriteType.visited);

  /// Удалить из избранных
  void removeFavorites(Place place) => _localStorage.removeFavorites(place);
}
