import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places_elementary/features/favorites/domain/entity/favorite.dart';
import 'package:places_elementary/features/favorites/domain/entity/favorite_type.dart';
import 'package:places_elementary/features/places/widgets/details_buttons/route_button.dart';
import 'package:places_elementary/features/places/widgets/details_buttons/route_finish_button.dart';

/// Билдер для кнопки построения маршрута
class RouteButtonBuilder extends StatelessWidget {
  final ListenableState<Favorite?> favoriteState;
  final VoidCallback buildRoute;

  const RouteButtonBuilder({
    Key? key,
    required this.favoriteState,
    required this.buildRoute,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StateNotifierBuilder<Favorite?>(
      listenableState: favoriteState,
      builder: (_, favorite) {
        if (favorite?.favoriteType == FavoriteType.visited) {
          return RouteFinishButton(buildRoute: buildRoute);
        }

        return RouteButton(buildRoute: buildRoute);
      },
    );
  }
}
