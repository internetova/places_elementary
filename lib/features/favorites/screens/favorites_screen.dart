import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places_elementary/features/favorites/screens/favorites_screen_wm.dart';

/// Экран Избранные места FavoritesScreen
class FavoritesScreen extends ElementaryWidget<IFavoritesScreenWidgetModel> {
  const FavoritesScreen({
    Key? key,
    WidgetModelFactory wmFactory = defaultFavoritesScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IFavoritesScreenWidgetModel wm) {
    return const Center(
      child: Text('FavoritesScreen'),
    );
  }
}
