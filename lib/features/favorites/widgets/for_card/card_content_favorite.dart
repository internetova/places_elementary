import 'package:flutter/material.dart';
import 'package:places_elementary/features/favorites/domain/entity/favorite.dart';
import 'package:places_elementary/features/favorites/widgets/for_card/date_favorites/date_favorites_widget.dart';

/// Контент карточки - название и детали
class CardContentFavorite extends StatelessWidget {
  final Favorite favorite;

  const CardContentFavorite({
    Key? key,
    required this.favorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          DateFavoritesWidget(favorite: favorite),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
