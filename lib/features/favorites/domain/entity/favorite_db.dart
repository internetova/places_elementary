import 'package:objectbox/objectbox.dart';

/// Избранное место для хранения в базе данных
@Entity()
class FavoriteDb {
  int id;
  @Index()
  int placeId;
  String place;
  String favoriteType;
  DateTime? date;

  FavoriteDb({
    this.id = 0,
    required this.placeId,
    required this.place,
    required this.favoriteType,
    this.date,
  });
}
