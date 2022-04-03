import 'package:flutter/material.dart';
import 'package:places_elementary/features/common/widgets/image_preview/image_preview.dart';
import 'package:places_elementary/features/places/constants/places_constants.dart';
import 'package:places_elementary/features/places/widgets/photo_slider/photo_viewing_indicator.dart';
import 'package:places_elementary/util/typedefs.dart';
import 'package:surf_util/surf_util.dart';

/// Слайдер для деталки места
class SliderItemsList extends StatelessWidget {
  final List<String> data;
  final PageController pageController;
  final ValueChanged<int> switchImage;
  final DataValueChanged<int, Color> getColorIndicator;

  const SliderItemsList({
    Key? key,
    required this.data,
    required this.pageController,
    required this.switchImage,
    required this.getColorIndicator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DisableOverscroll(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              PageView.builder(
                onPageChanged: switchImage,
                controller: pageController,
                itemCount: data.length,
                itemBuilder: (_, index) => ImagePreview(
                  imgUrl: data[index],
                  height: PlacesConstants.imageSliderHeight,
                ),
              ),
              Positioned(
                bottom: 0,
                child: ConstrainedBox(
                  constraints: BoxConstraints.tight(
                    Size(constraints.maxWidth, PlacesConstants.photoViewingIndicatorHeight),
                  ),
                  child: PhotoViewingIndicator(
                    data: data,
                    getColorIndicator: getColorIndicator,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
