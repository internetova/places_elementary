import 'package:cached_network_image/cached_network_image.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places_elementary/assets/colors/colors.dart';
import 'package:places_elementary/assets/res/app_assets.dart';
import 'package:places_elementary/features/common/constants/app_sizes.dart';
import 'package:places_elementary/features/favorites/domain/entity/favorite.dart';
import 'package:places_elementary/features/places/domain/entity/place.dart';
import 'package:places_elementary/features/places/widgets/test_coordinator/test_coordinator_screen_wm.dart';

/// Для тестирования работы координатора
/// Main widget for TestCoordinatorScreen module
class TestCoordinatorScreen extends ElementaryWidget<ITestCoordinatorScreenWidgetModel> {
  final ValueChanged<Place> goPlaceDetails;

  const TestCoordinatorScreen({
    Key? key,
    required this.goPlaceDetails,
    WidgetModelFactory wmFactory = defaultTestCoordinatorScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(ITestCoordinatorScreenWidgetModel wm) {
    return EntityStateNotifierBuilder<List<Favorite>>(
      listenableEntityState: wm.favoritesState,
      builder: (_, data) {
        return data != null && data.isNotEmpty
            ? SizedBox(
                height: 100,
                child: ListView.separated(
                  // child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (_, index) => InkWell(
                    onTap: () => goPlaceDetails(data[index].place),
                    child: CachedNetworkImage(
                      imageUrl: data[index].place.urls.first,
                      imageBuilder: (_, imageProvider) => _ImageBuilder(imageProvider: imageProvider),
                      placeholder: (_, __) => const _ImagePlaceholder(),
                      // ignore: implicit_dynamic_parameter
                      errorWidget: (_, __, ___) => const _ImagePlaceholder(),
                    ),
                  ),
                  separatorBuilder: (context, index) => AppSizes.sizedBoxW8,
                  scrollDirection: Axis.horizontal,
                ),
              )
            : const SizedBox.shrink();
      },
      loadingBuilder: (_, __) => const SizedBox.shrink(),
      errorBuilder: (_, __, ___) => const SizedBox.shrink(),
    );
  }
}

/// Загруженная картинка из сети
class _ImageBuilder extends StatelessWidget {
  final ImageProvider imageProvider;

  const _ImageBuilder({Key? key, required this.imageProvider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
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
        width: 40,
        height: 40,
        color: AppColors.colorInactiveBlack,
      ),
    );
  }
}
