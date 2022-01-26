import 'package:objectbox/objectbox.dart';

/// Избранное место
@Entity()
class Favorite {
  int id;
  @Index()
  int placeId;
  String favoriteType;
  DateTime? date;

  Favorite({
    this.id = 0,
    required this.placeId,
    required this.favoriteType,
    this.date,
  });
}
