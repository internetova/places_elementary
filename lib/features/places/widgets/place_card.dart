import 'package:flutter/material.dart';
import 'package:places_elementary/assets/res/app_assets.dart';
import 'package:places_elementary/features/common/constants/app_sizes.dart';
import 'package:places_elementary/features/common/widgets/buttons/icon_action_button.dart';
import 'package:places_elementary/features/places/domain/entity/place.dart';
import 'package:places_elementary/features/places/widgets/card_content_type.dart';

/// Карточка интересного места для главного списка мест
class PlaceCard extends StatelessWidget {
  final Place card;

  const PlaceCard({
    Key? key,
    required this.card,
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
                    _CardImagePreview(
                      imgUrl: card.urls.first,
                    ),
                    Positioned(
                      top: 8,
                      left: 16,
                      right: 12,
                      child: CardContentType(type: card.placeType),
                    ),
                  ],
                ),
                _CardContent(card: card),
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
              top: 8,
              right: 16,
              child: _CardActions(card: card),
            ),
          ],
        ),
      ),
    );
  }
}

/// Загружает картинку-превью карточки,
/// берёт первую из списка картинок
class _CardImagePreview extends StatelessWidget {
  final String imgUrl;

  const _CardImagePreview({
    Key? key,
    required this.imgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 96,
      child: Hero(
        tag: imgUrl,
        child: Image.network(
          imgUrl,
          fit: BoxFit.cover,
          frameBuilder: (
            context,
            child,
            frame,
            wasSynchronouslyLoaded,
          ) {
            if (wasSynchronouslyLoaded) {
              return child;
            }

            return AnimatedOpacity(
              child: child,
              opacity: frame == null ? 0 : 1,
              duration: AppSizes.milliseconds1500,
              curve: Curves.easeOut,
            );
          },
        ),
      ),
    );
  }
}

/// Кнопки действий: избранное
class _CardActions extends StatelessWidget {
  final Place card;

  const _CardActions({
    Key? key,
    required this.card,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconActionButton(
      onPressed: () {
        debugPrint('-------- Кнопка Избранное');
      },
      icon: AppAssets.icFavorites,
    );
  }
}

/// Контент карточки - название и детали
class _CardContent extends StatelessWidget {
  final Place card;

  const _CardContent({
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
