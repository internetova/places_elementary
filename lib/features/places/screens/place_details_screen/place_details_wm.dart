import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places_elementary/features/app/di/app_scope.dart';
import 'package:places_elementary/features/places/screens/place_details_screen/place_details_model.dart';
import 'package:places_elementary/features/places/screens/place_details_screen/place_details_screen.dart';
import 'package:provider/provider.dart';

abstract class IPlaceDetailsWidgetModel extends IWidgetModel {}

PlaceDetailsWidgetModel defaultPlaceDetailsWidgetModelFactory(BuildContext context) {
  final appDependencies = context.read<IAppScope>();
  final model = PlaceDetailsModel(appDependencies.errorHandler);

  return PlaceDetailsWidgetModel(model);
}

/// Default widget model for PlaceDetailsScreen
class PlaceDetailsWidgetModel extends WidgetModel<PlaceDetailsScreen, PlaceDetailsModel>
    implements IPlaceDetailsWidgetModel {
  PlaceDetailsWidgetModel(PlaceDetailsModel model) : super(model);
}
