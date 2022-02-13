import 'package:flutter/material.dart';
import 'package:places_elementary/features/common/constants/app_sizes.dart';
import 'package:places_elementary/features/common/widgets/for_card/card_content_type.dart';
import 'package:places_elementary/features/common/widgets/for_card/card_image_preview.dart';
import 'package:places_elementary/features/favorites/domain/entity/favorite.dart';
import 'package:places_elementary/features/favorites/widgets/for_card/card_actions_favorite.dart';
import 'package:places_elementary/features/favorites/widgets/for_card/card_content_favorite.dart';
import 'package:places_elementary/features/places/domain/entity/place.dart';

/// Карточка избранного места
class FavoriteCard extends StatelessWidget {
  final Favorite favorite;
  final ValueChanged<Place> goPlaceDetails;

  const FavoriteCard({
    Key? key,
    required this.favorite,
    required this.goPlaceDetails,
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
                      top: AppSizes.paddingStandard,
                      left: AppSizes.paddingStandard,
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
                  onTap: () => goPlaceDetails(favorite.place),
                ),
              ),
            ),
            Positioned(
              top: AppSizes.paddingStandard / 2,
              right: AppSizes.paddingStandard,
              child: CardActionsFavorite(favorite: favorite),
            ),
          ],
        ),
      ),
    );
  }
}
