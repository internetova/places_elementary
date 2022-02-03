import 'package:flutter/material.dart';
import 'package:places_elementary/features/favorites/widgets/remove_favorites_button/remove_favorites_button.dart';
import 'package:places_elementary/features/places/domain/entity/place.dart';

/// Кнопки действий на карточке Избранное
class CardActionsFavorite extends StatelessWidget {
  final Place place;

  const CardActionsFavorite({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RemoveFavoritesButton(place: place),
      ],
    );
  }
}
