import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places_elementary/assets/res/app_assets.dart';
import 'package:places_elementary/features/common/widgets/buttons/icon_action_button.dart';
import 'package:places_elementary/features/places/domain/entity/place.dart';
import 'package:places_elementary/features/places/widgets/favorites_button/favorites_button_wm.dart';

/// Виджет для списка мест - FavoritesButton
class FavoritesButtonWidget extends ElementaryWidget<IFavoritesButtonWidgetModel> {
  final Place place;

  const FavoritesButtonWidget({
    Key? key,
    required this.place,
    WidgetModelFactory wmFactory = defaultFavoritesButtonWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IFavoritesButtonWidgetModel wm) {
    return StateNotifierBuilder<bool>(
      listenableState: wm.isFavState,
      builder: (_, isFav) => IconActionButton(
        onPressed: wm.switchFavorites,
        icon: isFav! ? AppAssets.icFavoritesFull : AppAssets.icFavorites,
      ),
    );
  }
}
