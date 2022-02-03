import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places_elementary/assets/res/app_assets.dart';
import 'package:places_elementary/features/common/widgets/buttons/icon_action_button.dart';
import 'package:places_elementary/features/favorites/widgets/remove_favorites_button/remove_favorites_button_wm.dart';
import 'package:places_elementary/features/places/domain/entity/place.dart';

/// Виджет для избранных мест - RemoveFavoritesButton
class RemoveFavoritesButton extends ElementaryWidget<IRemoveFavoritesButtonWidgetModel> {
  final Place place;

  const RemoveFavoritesButton({
    Key? key,
    required this.place,
    WidgetModelFactory wmFactory = defaultRemoveFavoritesButtonWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IRemoveFavoritesButtonWidgetModel wm) {
    return IconActionButton(
        onPressed: wm.removeFavorite,
        icon: AppAssets.icDelete,
    );
  }
}
