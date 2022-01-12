import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places_elementary/features/app/di/app_scope.dart';
import 'package:places_elementary/features/navigation/domain/entity/app_coordinate.dart';
import 'package:places_elementary/features/navigation/service/coordinator.dart';
import 'package:places_elementary/features/temp/screens/temp_screen/temp_screen.dart';
import 'package:places_elementary/features/temp/screens/temp_screen/temp_screen_model.dart';
import 'package:provider/provider.dart';

/// Factory for [TempScreenWidgetModel].
// TODO(sugina): временно для теста.
TempScreenWidgetModel initScreenWidgetModelFactory(
  BuildContext context,
) {
  final appDependencies = context.read<IAppScope>();
  final model = TempScreenModel();
  final coordinator = appDependencies.coordinator;

  return TempScreenWidgetModel(model, coordinator);
}

/// Widget model for [TempScreen].
class TempScreenWidgetModel extends WidgetModel<TempScreen, TempScreenModel>
    implements IDebugWidgetModel {
  final Coordinator coordinator;

  /// Create an instance [TempScreenWidgetModel].
  TempScreenWidgetModel(
    TempScreenModel model,
    this.coordinator,
  ) : super(model);

  @override
  void goPlaceScreen() {
    coordinator.navigate(context, AppCoordinate.placesScreen);
  }

  @override
  void goMainScreen() {
    coordinator.navigate(context, AppCoordinate.mainScreen);
  }
}

/// Interface of [TempScreenWidgetModel].
abstract class IDebugWidgetModel extends IWidgetModel {
  void goPlaceScreen();

  void goMainScreen();
}
