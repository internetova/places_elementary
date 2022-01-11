import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places_elementary/features/app/di/app_scope.dart';
import 'package:places_elementary/features/feature_places/domain/entity/place.dart';
import 'package:places_elementary/features/feature_places/screens/places_screen/places_screen.dart';
import 'package:places_elementary/features/feature_places/screens/places_screen/places_screen_model.dart';
import 'package:provider/provider.dart';

abstract class IPlacesScreenWidgetModel extends IWidgetModel {
  ListenableState<EntityState<List<Place>>> get placesState;
}

PlacesScreenWidgetModel defaultPlacesScreenWidgetModelFactory(BuildContext context) {
  final appDependencies = context.read<IAppScope>();
  final model = PlacesScreenModel(appDependencies.placesService);

  return PlacesScreenWidgetModel(model);
}

/// Default widget model for PlacesScreenWidget
class PlacesScreenWidgetModel extends WidgetModel<PlacesScreen, PlacesScreenModel>
    implements IPlacesScreenWidgetModel {
  late final _placesState = EntityStateNotifier<List<Place>>();

  @override
  ListenableState<EntityState<List<Place>>> get placesState => _placesState;

  PlacesScreenWidgetModel(PlacesScreenModel model) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();

    _init();
  }

  Future<void> _init() async {
    _placesState.loading();
    // final places = await model.getAllPlaces();
    // _placesState.content(places);
  }
}
