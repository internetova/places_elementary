import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places_elementary/features/app/di/app_scope.dart';
import 'package:places_elementary/features/navigation/service/coordinator.dart';
import 'package:places_elementary/features/places/coordinates/place_details_coordinate.dart';
import 'package:places_elementary/features/places/widgets/photo_slider/slider/photo_slider_model.dart';
import 'package:places_elementary/features/places/widgets/photo_slider/slider/photo_slider_widget.dart';
import 'package:provider/provider.dart';

/// Контракт для PhotoSliderWidget
abstract class IPhotoSliderWidgetModel extends IWidgetModel {
  ListenableState<int> get currentImageState;

  PageController get pageController;

  Color get backgroundColorButtonBack;

  Color get iconColorButtonBack;

  void switchImage(int imageIndex);

  void viewImage(List<String> images, int imageIndex);

  Color getColorIndicator(int indicatorIndex);

  void goBack();
}

/// Фабрика для создания виджет модели
PhotoSliderWidgetModel defaultPhotoSliderWidgetModelFactory(BuildContext context) {
  final appDependencies = context.read<IAppScope>();
  final model = PhotoSliderModel(
    appDependencies.errorHandler,
  );
  final coordinator = appDependencies.coordinator;

  return PhotoSliderWidgetModel(model, coordinator);
}

/// Виджет модель для PhotoSliderWidget
class PhotoSliderWidgetModel extends WidgetModel<PhotoSliderWidget, PhotoSliderModel>
    implements IPhotoSliderWidgetModel {
  /// Текущая страница слайдера
  final _currentImageState = StateNotifier<int>(initValue: 0);
  final _pageController = PageController();
  final Coordinator _coordinator;

  @override
  ListenableState<int> get currentImageState => _currentImageState;

  @override
  PageController get pageController => _pageController;

  @override
  Color get backgroundColorButtonBack => Theme.of(context).primaryColor;

  @override
  Color get iconColorButtonBack => Theme.of(context).colorScheme.onPrimary;

  PhotoSliderWidgetModel(
    PhotoSliderModel model,
    this._coordinator,
  ) : super(model);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }


  @override
  void switchImage(int imageIndex) {
    _currentImageState.accept(imageIndex);
  }

  /// цвет индикатора просмотренных фотографий
  @override
  Color getColorIndicator(int indicatorIndex) {
    return indicatorIndex < _currentImageState.value! || indicatorIndex == _currentImageState.value!
        ? Theme.of(context).colorScheme.primary
        : Colors.transparent;
  }

  @override
  void goBack() {
    Navigator.of(context).pop();
  }

  @override
  void viewImage(List<String> images, int imageIndex) {
    _coordinator.navigate(
      context,
      PlaceDetailsCoordinate.photoViewScreen,
      arguments: {
        'images': images,
        'currentIndex': imageIndex,
      },
    );
  }
}
