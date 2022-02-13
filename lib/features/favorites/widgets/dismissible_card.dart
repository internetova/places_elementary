import 'package:flutter/material.dart';
import 'package:places_elementary/features/common/constants/app_sizes.dart';
import 'package:places_elementary/features/favorites/domain/entity/favorite.dart';
import 'package:places_elementary/features/favorites/widgets/favorite_card.dart';
import 'package:places_elementary/features/favorites/widgets/for_card/card_dismiss_background.dart';
import 'package:places_elementary/features/places/domain/entity/place.dart';

/// Карточка экрана Избранное, можно удалить смахиванием
class DismissibleFavoriteCard extends StatelessWidget {
  final Favorite favorite;
  final ValueChanged<Place> removeFromFavorites;
  final ValueChanged<Place> goPlaceDetails;

  const DismissibleFavoriteCard({
    Key? key,
    required this.favorite,
    required this.removeFromFavorites,
    required this.goPlaceDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(
        AppSizes.paddingStandard,
        0,
        AppSizes.paddingStandard,
        AppSizes.paddingStandard,
      ),
      child: Stack(
        children: [
          const CardDismissBackground(),
          Dismissible(
            key: UniqueKey(),
            onDismissed: (_) {
              removeFromFavorites(favorite.place);
            },
            direction: DismissDirection.endToStart,
            child: FavoriteCard(
              favorite: favorite,
              goPlaceDetails: goPlaceDetails,
            ),
          ),
        ],
      ),
    );
  }
}
