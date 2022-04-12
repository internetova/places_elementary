import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places_elementary/assets/res/app_assets.dart';
import 'package:places_elementary/features/common/constants/app_sizes.dart';
import 'package:places_elementary/features/common/widgets/buttons/button_rounded.dart';
import 'package:places_elementary/features/places/widgets/photo_slider/slider/photo_slider_wm.dart';
import 'package:places_elementary/features/places/widgets/photo_slider/slider_Items_list.dart';

/// Фотогалерея для детальной страницы места
class PhotoSliderWidget extends ElementaryWidget<IPhotoSliderWidgetModel> {
  final List<String> images;

  const PhotoSliderWidget(
    this.images, {
    Key? key,
    WidgetModelFactory wmFactory = defaultPhotoSliderWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IPhotoSliderWidgetModel wm) {
    return StateNotifierBuilder<int>(
      listenableState: wm.currentImageState,
      builder: (context, currentImage) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                SliderItemsList(
                  data: images,
                  pageController: wm.pageController,
                  switchImage: wm.switchImage,
                  getColorIndicator: wm.getColorIndicator,
                  viewImage: wm.viewImage,
                ),
                Positioned(
                  top: 16,
                  left: 16,
                  child: ButtonRounded(
                    size: 32,
                    radius: AppSizes.radiusButtonSmall,
                    backgroundColor: wm.backgroundColorButtonBack,
                    icon: AppAssets.icArrow,
                    iconColor: wm.iconColorButtonBack,
                    onPressed: wm.goBack,
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
