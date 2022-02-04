import 'package:flutter/material.dart';
import 'package:places_elementary/features/common/constants/app_sizes.dart';
import 'package:places_elementary/features/favorites/domain/entity/favorite.dart';
import 'package:places_elementary/features/favorites/domain/entity/favorite_type.dart';
import 'package:places_elementary/features/favorites/widgets/reminder_favorites_button/reminder_favorites_button.dart';
import 'package:places_elementary/features/favorites/widgets/remove_favorites_button/remove_favorites_button.dart';

/// Кнопки действий на карточке Избранное
class CardActionsFavorite extends StatelessWidget {
  final Favorite favorite;

  const CardActionsFavorite({Key? key, required this.favorite}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (favorite.favoriteType == FavoriteType.planned)
          ReminderFavoritesButton(favorite: favorite),
        AppSizes.sizedBoxW8,
        RemoveFavoritesButton(place: favorite.place),
      ],
    );
  }
}
