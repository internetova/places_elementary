import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places_elementary/features/app/di/app_scope.dart';
import 'package:places_elementary/features/places/domain/entity/place.dart';
import 'package:places_elementary/features/places/screens/places_screen/places_screen.dart';
import 'package:places_elementary/features/places/screens/places_screen/places_screen_model.dart';
import 'package:provider/provider.dart';

abstract class IPlacesScreenWidgetModel extends IWidgetModel {
  ListenableState<EntityState<List<Place>>> get placesState;

  ScrollController get scrollController;

  Future<void> refreshPlaces();

  void goTop();
}

PlacesScreenWidgetModel defaultPlacesScreenWidgetModelFactory(BuildContext context) {
  final appDependencies = context.read<IAppScope>();
  final model = PlacesScreenModel(appDependencies.errorHandler, appDependencies.placesService);

  return PlacesScreenWidgetModel(model);
}

/// Default widget model for PlacesScreen
class PlacesScreenWidgetModel extends WidgetModel<PlacesScreen, PlacesScreenModel>
    implements IPlacesScreenWidgetModel {
  late final _placesState = EntityStateNotifier<List<Place>>();

  final _scrollController = ScrollController();

  @override
  ListenableState<EntityState<List<Place>>> get placesState => _placesState;

  @override
  ScrollController get scrollController => _scrollController;

  PlacesScreenWidgetModel(PlacesScreenModel model) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();

    _init();
  }

  @override
  void dispose() {
    scrollController.dispose();

    super.dispose();
  }

  /// Повторный запрос данных
  @override
  Future<void> refreshPlaces() async => _init();

  /// Перейти наверх
  @override
  void goTop() => _scrollController.jumpTo(0);

  Future<void> _init() async {
    _placesState.loading();
    final places = await model.getAllPlaces();
    _placesState.content(places);
  }
}