import 'package:flutter/material.dart';
import 'package:places_elementary/features/places/domain/entity/place.dart';

/// Контент карточки для главного экрана - название и детали
class CardContent extends StatelessWidget {
  final Place card;

  const CardContent({
    Key? key,
    required this.card,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            card.name,
            style: Theme.of(context).textTheme.headline5,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          const SizedBox(
            width: double.infinity,
            height: 2,
          ),
          Text(
            card.description,
            style: Theme.of(context).textTheme.bodyText2,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}