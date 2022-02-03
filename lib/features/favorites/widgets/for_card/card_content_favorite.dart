import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:places_elementary/assets/themes/themes.dart';
import 'package:places_elementary/features/favorites/domain/entity/favorite.dart';
import 'package:places_elementary/features/favorites/domain/entity/favorite_type.dart';

/// Контент карточки - название и детали
class CardContentFavorite extends StatelessWidget {
  final Favorite favorite;

  const CardContentFavorite({
    Key? key,
    required this.favorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    final dataText = favorite.favoriteType == FavoriteType.planned
        ? appLocalizations!.favoritesDatePlanned
        : appLocalizations!.favoritesDateVisited;
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            favorite.place.name,
            style: Theme.of(context).textTheme.headline5,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          const SizedBox(
            width: double.infinity,
            height: 2,
          ),
          if (favorite.date != null)
            Text(
              '$dataText ${favorite.date}',
              style: favorite.favoriteType == FavoriteType.planned
                  ? theme.textTheme.bodyText2?.copyWith(color: theme.colorScheme.green)
                  : theme.textTheme.bodyText2,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
