import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places_elementary/features/favorites/domain/entity/favorite.dart';
import 'package:places_elementary/features/favorites/domain/entity/favorite_type.dart';
import 'package:places_elementary/features/favorites/screens/favorites_screen_wm.dart';
import 'package:places_elementary/features/favorites/widgets/favorites_appbar.dart';
import 'package:places_elementary/features/favorites/widgets/favorites_builder.dart';

/// Экран Избранные места FavoritesScreen
class FavoritesScreen extends ElementaryWidget<IFavoritesScreenWidgetModel> {
  const FavoritesScreen({
    Key? key,
    WidgetModelFactory wmFactory = defaultFavoritesScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IFavoritesScreenWidgetModel wm) {
    return Scaffold(
      appBar: FavoritesAppBar(tabController: wm.tabController),
      body: TabBarView(
        controller: wm.tabController,
        children: [
          EntityStateNotifierBuilder<List<Favorite>>(
            listenableEntityState: wm.plannedPlacesState,
            builder: (_, data) => FavoritesBuilder(
              data: data!,
              favoriteType: FavoriteType.planned,
              removeFromFavorites: wm.removeFavorite,
            ),
          ),
          EntityStateNotifierBuilder<List<Favorite>>(
            listenableEntityState: wm.visitedPlacesState,
            builder: (_, data) => FavoritesBuilder(
              data: data!,
              favoriteType: FavoriteType.visited,
              removeFromFavorites: wm.removeFavorite,
            ),
          ),
        ],
      ),
    );
  }
}
