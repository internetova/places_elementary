import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places_elementary/features/app/di/app_scope.dart';
import 'package:places_elementary/features/places/screens/photo_view_screen/photo_view_screen.dart';
import 'package:places_elementary/features/places/screens/photo_view_screen/photo_view_screen_model.dart';
import 'package:provider/provider.dart';

abstract class IPhotoViewScreenWidgetModel extends IWidgetModel {
}

PhotoViewScreenWidgetModel defaultPhotoViewScreenWidgetModelFactory(BuildContext context) {
  final appDependencies = context.read<IAppScope>();
  final model = PhotoViewScreenModel(
    appDependencies.errorHandler,
    appDependencies.placesService,
  );

  return PhotoViewScreenWidgetModel(model);
}

/// Default widget model for PhotoViewScreenWidget
class PhotoViewScreenWidgetModel extends WidgetModel<PhotoViewScreen, PhotoViewScreenModel>
    implements IPhotoViewScreenWidgetModel {

  PhotoViewScreenWidgetModel(PhotoViewScreenModel model) : super(model);
}
