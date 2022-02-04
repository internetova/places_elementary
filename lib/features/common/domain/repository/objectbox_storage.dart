import 'dart:convert';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:places_elementary/features/common/domain/repository/i_local_storage.dart';
import 'package:places_elementary/features/favorites/domain/entity/favorite.dart';
import 'package:places_elementary/features/favorites/domain/entity/favorite_db.dart';
import 'package:places_elementary/features/favorites/domain/entity/favorite_type.dart';
import 'package:places_elementary/features/favorites/domain/mappers/favorites_mapper.dart';
import 'package:places_elementary/features/places/domain/entity/place.dart';
import 'package:places_elementary/objectbox.g.dart';

/// Локальное хранилище с использованием Objectbox
/// Храним:
/// - избранные места
/// - историю запросов поиска (тексты запроса)
class ObjectboxStorage implements ILocalStorage {
  late final Store store;
  late final Box favoritesBox;

  /// Место избранное?
  @override
  bool isFavorite(Place place) {
    final query = favoritesBox
        .query(
          FavoriteDb_.placeId.equals(place.id),
        )
        .build();

    final fav = query.findFirst() as FavoriteDb?;
    query.close();

    return fav != null;
  }

  /// Добавить в избранные
  @override
  void addFavorites(Place place) {
    favoritesBox.put(
      FavoriteDb(
        placeId: place.id,
        place: json.encode(place),
        favoriteType: FavoriteType.planned.name,
      ),
    );
  }

  /// Удалить из избранных
  @override
  void removeFavorites(Place place) {
    final query = favoritesBox
        .query(
          FavoriteDb_.placeId.equals(place.id),
        )
        .build();

    final fav = query.findFirst() as FavoriteDb?;

    if (fav != null) {
      favoritesBox.remove(fav.id);
    }
  }

  /// Получить список избранных мест
  @override
  List<Favorite> getFavoritesPlaces(FavoriteType favoriteType) {
    final query = favoritesBox
        .query(
          FavoriteDb_.favoriteType.equals(favoriteType.name),
        )
        .build();

    final places = query.find() as List<FavoriteDb>;
    query.close();

    return places.map(mapFavorite).toList();
  }

  /// Установить дату и время посещения места
  @override
  void setReminder(Favorite favorite) {
    favoritesBox.put(
      mapFavoriteDb(favorite),
      mode: PutMode.update,
    );
  }

  /// Получить место
  @override
  Favorite getFavorite(int id) {
    final query = favoritesBox
        .query(
      FavoriteDb_.placeId.equals(id),
    )
        .build();

    final place = query.findFirst() as FavoriteDb;
    query.close();

    return mapFavorite(place);
  }

  void init() {
    getApplicationDocumentsDirectory().then((dir) {
      store = Store(
        getObjectBoxModel(),
        directory: join(dir.path, 'objectbox'),
      );
      favoritesBox = store.box<FavoriteDb>();
    });
  }
}
