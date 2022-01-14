import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places_elementary/assets/colors/colors.dart';
import 'package:places_elementary/assets/res/app_assets.dart';
import 'package:places_elementary/features/common/constants/app_sizes.dart';
import 'package:places_elementary/features/common/widgets/buttons/icon_action_button.dart';
import 'package:places_elementary/features/places/constants/places_constants.dart';
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
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: PlacesConstants.heightImagePreview,
          child: CachedNetworkImage(
            imageUrl: imgUrl,
            imageBuilder: (_, imageProvider) => _ImageBuilder(imageProvider: imageProvider),
            placeholder: (_, __) => const _ImagePlaceholder(),
            // ignore: implicit_dynamic_parameter
            errorWidget: (_, __, ___) => const _ImagePlaceholder(),
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: PlacesConstants.heightImagePreview,
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.colorWhiteMain.withOpacity(0.3),
                  AppColors.colorSecondary.withOpacity(0.08),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// Загруженная картинка из сети
class _ImageBuilder extends StatelessWidget {
  final ImageProvider imageProvider;

  const _ImageBuilder({Key? key, required this.imageProvider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

/// Плейсхолдер на время загрузки и если есть ошибка
class _ImagePlaceholder extends StatelessWidget {
  const _ImagePlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        AppAssets.icPhoto,
        width: 64,
        height: 64,
        color: AppColors.colorInactiveBlack,
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
