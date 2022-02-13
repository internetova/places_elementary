import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:places_elementary/assets/res/app_assets.dart';
import 'package:places_elementary/features/common/constants/app_sizes.dart';
import 'package:places_elementary/features/common/widgets/buttons/icon_action_button.dart';
import 'package:places_elementary/features/common/widgets/buttons/icon_svg.dart';
import 'package:places_elementary/features/places/domain/entity/favorites_button_type.dart';
import 'package:places_elementary/features/places/domain/entity/place.dart';
import 'package:places_elementary/features/places/widgets/favorites_button/favorites_button_wm.dart';

/// Виджет для списка мест - FavoritesButton
class FavoritesButtonWidget extends ElementaryWidget<IFavoritesButtonWidgetModel> {
  final Place place;
  final FavoritesButtonType buttonType;

  const FavoritesButtonWidget({
    Key? key,
    required this.place,
    this.buttonType = FavoritesButtonType.small,
    WidgetModelFactory wmFactory = defaultFavoritesButtonWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IFavoritesButtonWidgetModel wm) {
    return StateNotifierBuilder<bool>(
      listenableState: wm.isFavState,
      builder: (_, isFav) {
        return buttonType == FavoritesButtonType.small
            ? IconActionButton(
                onPressed: wm.switchFavorites,
                icon: isFav! ? AppAssets.icFavoritesFull : AppAssets.icFavorites,
              )
            : _FavoritesButtonBig(
                isFavorite: isFav!,
                switchFavorites: wm.switchFavorites,
              );
      },
    );
  }
}

/// Кнопка Избранное для экрана PlaceDetailsScreen
class _FavoritesButtonBig extends StatelessWidget {
  final VoidCallback switchFavorites;
  final bool isFavorite;

  const _FavoritesButtonBig({
    Key? key,
    required this.switchFavorites,
    required this.isFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: AppSizes.milliseconds400,
      child: TextButton(
        key: ValueKey(isFavorite),
        onPressed: switchFavorites,
        style: TextButton.styleFrom(
          minimumSize: const Size.fromHeight(40),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconSvg(
              icon: isFavorite ? AppAssets.icFavoritesFull : AppAssets.icFavorites,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            AppSizes.sizedBoxW4,
            Text(
              isFavorite
                  ? AppLocalizations.of(context)!.detailsButtonTitleIsFavourites
                  : AppLocalizations.of(context)!.detailsButtonTitleAddToFavourites,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ),
    );
  }
}
