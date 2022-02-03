import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places_elementary/assets/colors/colors.dart';
import 'package:places_elementary/assets/res/app_assets.dart';
import 'package:places_elementary/features/places/constants/places_constants.dart';

/// Загружает картинку-превью карточки,
/// берёт первую из списка картинок
class CardImagePreview extends StatelessWidget {
  final String imgUrl;

  const CardImagePreview({
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