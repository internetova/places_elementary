import 'dart:convert';

import 'package:places_elementary/features/favorites/domain/entity/favorite.dart';
import 'package:places_elementary/features/favorites/domain/entity/favorite_db.dart';
import 'package:places_elementary/features/favorites/domain/entity/favorite_type.dart';
import 'package:places_elementary/features/places/domain/entity/place.dart';

/// Маппер [Favorite] из [FavoriteDb]
Favorite mapFavorite(FavoriteDb data) {
  return Favorite(
    id: data.id,
    place: Place.fromJson(json.decode(data.place) as Map<String, dynamic>),
    favoriteType: FavoriteType.values.byName(data.favoriteType),
    date: data.date,
  );
}

/// Маппер [Favorite] из [FavoriteDb]
FavoriteDb mapFavoriteDb(Favorite data) {
  return FavoriteDb(
    id: data.id,
    placeId: data.place.id,
    place: json.encode(data.place),
    favoriteType: data.favoriteType.name,
    date: data.date,
  );
}
