import 'package:flutter/material.dart';
import 'package:places_elementary/features/common/constants/app_sizes.dart';
import 'package:places_elementary/features/common/widgets/for_card/card_content_type.dart';
import 'package:places_elementary/features/common/widgets/image_preview/image_preview.dart';
import 'package:places_elementary/features/places/constants/places_constants.dart';
import 'package:places_elementary/features/places/domain/entity/place.dart';
import 'package:places_elementary/features/places/widgets/favorites_button/favorites_button_widget.dart';
import 'package:places_elementary/features/places/widgets/for_card/card_content.dart';

/// Карточка интересного места для главного списка мест
class PlaceCard extends StatelessWidget {
  final Place place;
  final ValueChanged<Place> goPlaceDetails;

  const PlaceCard({
    Key? key,
    required this.place,
    required this.goPlaceDetails,
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
                    ImagePreview(
                      imgUrl: place.urls.first,
                      height: PlacesConstants.cardImageHeight,
                    ),
                    Positioned(
                      top: AppSizes.paddingStandard,
                      left: AppSizes.paddingStandard,
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
                  onTap: () => goPlaceDetails(place),
                ),
              ),
            ),
            Positioned(
              top: AppSizes.paddingStandard / 2,
              right: AppSizes.paddingStandard,
              child: FavoritesButtonWidget(place: place),
            ),
          ],
        ),
      ),
    );
  }
}
