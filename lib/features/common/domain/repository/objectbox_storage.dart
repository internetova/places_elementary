import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:places_elementary/features/places/domain/entity/favorite.dart';
import 'package:places_elementary/features/places/domain/entity/favorite_type.dart';
import 'package:places_elementary/features/places/domain/entity/place.dart';
import 'package:places_elementary/objectbox.g.dart';

/// Локальное хранилище с использованием Objectbox
/// Храним:
/// - избранные места
/// - историю запросов поиска (тексты запроса)
class ObjectboxStorage {
  late final Store store;
  late final Box favoritesBox;

  void init() {
    getApplicationDocumentsDirectory().then((dir) {
      store = Store(
        getObjectBoxModel(),
        directory: join(dir.path, 'objectbox'),
      );
      favoritesBox = store.box<Favorite>();
    });
  }

  /// Место избранное?
  bool isFavorite(Place place) {
    final query = favoritesBox
        .query(
          Favorite_.placeId.equals(place.id),
        )
        .build();

    final fav = query.findFirst() as Favorite?;
    query.close();

    return fav != null;
  }

  /// Добавить в избранные
  void addFavorites(Place place) {
    favoritesBox.put(
      Favorite(
        placeId: place.id,
        favoriteType: FavoriteType.planned.toString(),
      ),
    );
  }

  /// Удалить из избранных
  void removeFavorites(Place place) {
    final query = favoritesBox
        .query(
          Favorite_.placeId.equals(place.id),
        )
        .build();

    final fav = query.findFirst() as Favorite?;

    if (fav != null) {
      favoritesBox.remove(fav.id);
    }
  }

  /// Получить список избранных Планирую
  List<Favorite> getPlannedPlaces() {
    final query = favoritesBox
        .query(
          Favorite_.favoriteType.equals(FavoriteType.planned.toString()),
        )
        .build();

    final places = query.find() as List<Favorite>;
    query.close();

    return places;
  }

  /// Получить список избранных Посетил
  List<Favorite> getVisitedPlaces() {
    final query = favoritesBox
        .query(
          Favorite_.favoriteType.equals(FavoriteType.visited.toString()),
        )
        .build();

    final places = query.find() as List<Favorite>;
    query.close();

    return places;
  }
}
