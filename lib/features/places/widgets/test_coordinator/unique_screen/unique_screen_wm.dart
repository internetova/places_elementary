import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places_elementary/features/app/di/app_scope.dart';
import 'package:places_elementary/features/navigation/service/coordinator.dart';
import 'package:places_elementary/features/places/coordinates/place_details_coordinate.dart';
import 'package:places_elementary/features/places/widgets/test_coordinator/unique_screen/unique_screen.dart';
import 'package:places_elementary/features/places/widgets/test_coordinator/unique_screen/unique_screen_model.dart';
import 'package:provider/provider.dart';

abstract class IUniqueScreenWidgetModel extends IWidgetModel {
  TextStyle? get style;

  void goBack();

  void goUniqueScreen();
}

UniqueScreenWidgetModel defaultUniqueScreenWidgetModelFactory(BuildContext context) {
  final appDependencies = context.read<IAppScope>();
  final model = UniqueScreenModel(appDependencies.errorHandler);
  final coordinator = appDependencies.coordinator;

  return UniqueScreenWidgetModel(model, coordinator);
}

/// Default widget model for UniqueScreenWidget
class UniqueScreenWidgetModel extends WidgetModel<UniqueScreen, UniqueScreenModel>
    implements IUniqueScreenWidgetModel {
  final Coordinator _coordinator;

  @override
  TextStyle? get style => Theme.of(context).textTheme.headline4;

  UniqueScreenWidgetModel(
    UniqueScreenModel model,
    this._coordinator,
  ) : super(model);

  @override
  void goBack() {
    _coordinator.pop();
  }

  @override
  void goUniqueScreen() {
    _coordinator.navigate(
      context,
      PlaceDetailsCoordinate.uniqueScreen,
    );
  }
}
