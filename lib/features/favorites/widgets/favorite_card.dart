import 'package:flutter/material.dart';
import 'package:places_elementary/features/common/constants/app_sizes.dart';
import 'package:places_elementary/features/common/widgets/for_card/card_content_type.dart';
import 'package:places_elementary/features/common/widgets/for_card/card_image_preview.dart';
import 'package:places_elementary/features/favorites/domain/entity/favorite.dart';
import 'package:places_elementary/features/favorites/widgets/for_card/card_actions_favorite.dart';
import 'package:places_elementary/features/favorites/widgets/for_card/card_content_favorite.dart';

/// Карточка избранного места
class FavoriteCard extends StatelessWidget {
  final Favorite favorite;

  const FavoriteCard({
    Key? key,
    required this.favorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 2,
      child: Material(
        borderRadius: BorderRadius.circular(AppSizes.radiusCard),
        clipBehavior: Clip.antiAlias,
        color: Theme.of(context).primaryColorLight,
        child: Stack(
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    CardImagePreview(
                      imgUrl: favorite.place.urls.first,
                    ),
                    Positioned(
                      top: 10,
                      left: 16,
                      right: 12,
                      child: CardContentType(type: favorite.place.placeType),
                    ),
                  ],
                ),
                CardContentFavorite(
                  favorite: favorite,
                ),
              ],
            ),
            Positioned.fill(
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  onTap: () {
                    debugPrint('--------Клик по карточке');
                  },
                ),
              ),
            ),
            Positioned(
              top: 4,
              right: 16,
              child: CardActionsFavorite(place: favorite.place),
            ),
          ],
        ),
      ),
    );
  }
}
