import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:places_elementary/features/common/widgets/buttons/button_close.dart';
import 'package:places_elementary/features/places/constants/places_constants.dart';
import 'package:places_elementary/features/places/screens/photo_view_screen/photo_view_screen_wm.dart';

/// Main widget for PhotoViewScreen module - просмотр фото при переходе из фото слайдера
class PhotoViewScreen extends ElementaryWidget<IPhotoViewScreenWidgetModel> {
  final List<String> images;
  final int currentIndex;

  const PhotoViewScreen({
    required this.images,
    required this.currentIndex,
    Key? key,
    WidgetModelFactory wmFactory = defaultPhotoViewScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IPhotoViewScreenWidgetModel wm) {
    return Scaffold(
      appBar: _AppBar(
        images: images,
        currentIndex: wm.currentImageState,
        close: wm.goBack,
      ),
      body: StateNotifierBuilder<int>(
        listenableState: wm.currentImageState,
        builder: (_, currentImage) {
          return PhotoViewGallery.builder(
            scrollPhysics: const BouncingScrollPhysics(),
            builder: (_, index) {
              return PhotoViewGalleryPageOptions(
                imageProvider: NetworkImage(images[index]),
                initialScale: PhotoViewComputedScale.contained * 1,
                minScale: PhotoViewComputedScale.contained * 0.8,
                maxScale: PhotoViewComputedScale.covered * 1.1,
              );
            },
            itemCount: images.length,
            loadingBuilder: (_, progress) => const Center(
              child: SizedBox(
                width: 20.0,
                height: 20.0,
                child: CircularProgressIndicator(),
              ),
            ),
            backgroundDecoration: const BoxDecoration(color: Colors.transparent),
            pageController: wm.pageController,
            onPageChanged: wm.onPageChanged,
          );
        },
      ),
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<String> images;
  final ListenableState<int> currentIndex;
  final VoidCallback close;

  @override
  Size get preferredSize => const Size.fromHeight(PlacesConstants.appBarStandardHeight);

  const _AppBar({
    required this.images,
    required this.currentIndex,
    required this.close,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: PlacesConstants.appBarStandardHeight,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: StateNotifierBuilder<int>(
        listenableState: currentIndex,
        builder: (context, currentImage) {
          return Text('${currentImage! + 1} / ${images.length}');
        },
      ),
      actions: [
        ButtonClose(onPressed: close),
      ],
    );
  }
}
