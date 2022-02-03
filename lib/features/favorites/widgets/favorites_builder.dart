import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:places_elementary/assets/res/app_assets.dart';
import 'package:places_elementary/features/common/widgets/error/error_state_widget.dart';
import 'package:places_elementary/features/favorites/domain/entity/favorite.dart';
import 'package:places_elementary/features/favorites/domain/entity/favorite_type.dart';
import 'package:places_elementary/features/favorites/widgets/dismissible_card.dart';
import 'package:places_elementary/features/places/domain/entity/place.dart';

/// Список карточек для экрана избранное
class FavoritesBuilder extends StatelessWidget {
  final List<Favorite> data;
  final FavoriteType favoriteType;
  final ValueChanged<Place> removeFromFavorites;

  const FavoritesBuilder({
    Key? key,
    required this.data,
    required this.favoriteType,
    required this.removeFromFavorites,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return data.isNotEmpty
        ? ListView.builder(
            itemBuilder: (_, index) => DismissibleFavoriteCard(
              favorite: data[index],
              removeFromFavorites: removeFromFavorites,
            ),
            itemCount: data.length,
          )
        : ErrorStateWidget(
            icon: favoriteType == FavoriteType.planned
                ? AppAssets.icEmptyPlanned
                : AppAssets.icEmptyVisited,
            header: AppLocalizations.of(context)!.errorEmptyHeader,
            text: favoriteType == FavoriteType.planned
                ? AppLocalizations.of(context)!.favoritesPlannedEmptyText
                : AppLocalizations.of(context)!.favoritesVisitedEmptyText,
          );
  }
}
