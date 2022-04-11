import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places_elementary/features/places/screens/photo_view_screen/photo_view_screen_wm.dart';

/// Main widget for PhotoViewScreen module - просмотр фото при переходе из фото слайдера
class PhotoViewScreen extends ElementaryWidget<IPhotoViewScreenWidgetModel> {
  const PhotoViewScreen({
    Key? key,
    WidgetModelFactory wmFactory = defaultPhotoViewScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IPhotoViewScreenWidgetModel wm) {
    return Container();
  }
}
