import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places_elementary/features/app/di/app_scope.dart';
import 'package:places_elementary/features/places/screens/photo_view_screen/photo_view_screen.dart';
import 'package:places_elementary/features/places/screens/photo_view_screen/photo_view_screen_model.dart';
import 'package:provider/provider.dart';

abstract class IPhotoViewScreenWidgetModel extends IWidgetModel {
  ListenableState<int> get currentImageState;

  PageController get pageController;

  void onPageChanged(int imageIndex);

  void goBack();
}

PhotoViewScreenWidgetModel defaultPhotoViewScreenWidgetModelFactory(BuildContext context) {
  final appDependencies = context.read<IAppScope>();
  final model = PhotoViewScreenModel(
    appDependencies.errorHandler,
  );

  return PhotoViewScreenWidgetModel(model);
}

/// Default widget model for PhotoViewScreenWidget
class PhotoViewScreenWidgetModel extends WidgetModel<PhotoViewScreen, PhotoViewScreenModel>
    implements IPhotoViewScreenWidgetModel {
  /// Текущая фотография
  late final StateNotifier<int> _currentImageState;
  late final PageController _pageController;

  @override
  ListenableState<int> get currentImageState => _currentImageState;

  @override
  PageController get pageController => _pageController;

  PhotoViewScreenWidgetModel(PhotoViewScreenModel model) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();

    _currentImageState = StateNotifier<int>(initValue: widget.currentIndex);
    _pageController = PageController(initialPage: widget.currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }


  @override
  void onPageChanged(int imageIndex) {
    _currentImageState.accept(imageIndex);
  }

  @override
  void goBack() {
    Navigator.of(context).pop();
  }
}
