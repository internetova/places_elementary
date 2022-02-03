import 'package:places_elementary/features/favorites/domain/entity/favorite.dart';
import 'package:places_elementary/features/favorites/domain/entity/favorite_type.dart';
import 'package:places_elementary/features/places/domain/entity/place.dart';

/// Интерфейс локальной базы данных для хранения мест
abstract class ILocalStorage {
  /// Место избранное?
  bool isFavorite(Place place);

  /// Добавить в избранные
  void addFavorites(Place place);

  /// Удалить из избранных
  void removeFavorites(Place place);

  /// Получить список избранных мест
  List<Favorite> getFavoritesPlaces(FavoriteType favoriteType);
}