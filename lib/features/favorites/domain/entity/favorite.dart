import 'package:places_elementary/features/favorites/domain/entity/favorite_type.dart';
import 'package:places_elementary/features/places/domain/entity/place.dart';

/// Избранное место для ui
/// [id] - идентификатор базы данных
class Favorite {
  int id;
  Place place;
  FavoriteType favoriteType;
  DateTime? date;

  Favorite({
    this.id = 0,
    required this.place,
    required this.favoriteType,
    this.date,
  });
}
