import 'package:flutter/material.dart';
import 'package:places_elementary/features/places/domain/entity/place.dart';

/// Основной текстовый контент для детальной страницы
class PlaceDetailsContent extends StatelessWidget {
  final Place place;

  const PlaceDetailsContent({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          place.name,
          style: theme.textTheme.headline4,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 2, bottom: 24),
          child: Row(
            children: [
              Text(
                place.placeType,
                style: theme.textTheme.subtitle1,
              ),
            ],
          ),
        ),
        Text(
          place.description,
          style: theme.textTheme.bodyText1,
        ),
      ],
    );
  }
}
