import 'package:flutter/material.dart';
import 'package:places_elementary/features/common/constants/app_sizes.dart';
import 'package:places_elementary/features/common/widgets/for_card/card_content_type.dart';
import 'package:places_elementary/features/common/widgets/for_card/card_image_preview.dart';
import 'package:places_elementary/features/places/domain/entity/place.dart';
import 'package:places_elementary/features/places/widgets/favorites_button/favorites_button_widget.dart';
import 'package:places_elementary/features/places/widgets/for_card/card_content.dart';

/// Карточка интересного места для главного списка мест
class PlaceCard extends StatelessWidget {
  final Place place;

  const PlaceCard({
    Key? key,
    required this.place,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 2,
      child: Material(
        borderRadius: BorderRadius.circular(AppSizes.radiusCard),
        clipBehavior: Clip.antiAlias,
        color: Theme.of(context).primaryColorLight,
        child: Stack(
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    CardImagePreview(
                      imgUrl: place.urls.first,
                    ),
                    Positioned(
                      top: 10,
                      left: 16,
                      right: 12,
                      child: CardContentType(type: place.placeType),
                    ),
                  ],
                ),
                CardContent(card: place),
              ],
            ),
            Positioned.fill(
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  onTap: () {
                    debugPrint('--------Клик по карточке');
                  },
                ),
              ),
            ),
            Positioned(
              top: 4,
              right: 16,
              child: FavoritesButtonWidget(place: place),
            ),
          ],
        ),
      ),
    );
  }
}
