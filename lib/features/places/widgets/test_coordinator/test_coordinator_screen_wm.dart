import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places_elementary/features/app/di/app_scope.dart';
import 'package:places_elementary/features/favorites/domain/entity/favorite.dart';
import 'package:places_elementary/features/places/widgets/test_coordinator/test_coordinator_screen.dart';
import 'package:places_elementary/features/places/widgets/test_coordinator/test_coordinator_screen_model.dart';
import 'package:provider/provider.dart';

abstract class ITestCoordinatorScreenWidgetModel extends IWidgetModel {
  ListenableState<EntityState<List<Favorite>>> get favoritesState;
}

TestCoordinatorScreenWidgetModel defaultTestCoordinatorScreenWidgetModelFactory(
  BuildContext context,
) {
  final appDependencies = context.read<IAppScope>();
  final model = TestCoordinatorScreenModel(
    appDependencies.errorHandler,
    appDependencies.favoritesService,
  );

  return TestCoordinatorScreenWidgetModel(model);
}

/// Default widget model for TestCoordinatorScreenWidget
class TestCoordinatorScreenWidgetModel
    extends WidgetModel<TestCoordinatorScreen, TestCoordinatorScreenModel>
    implements ITestCoordinatorScreenWidgetModel {
  final _favoritesState = EntityStateNotifier<List<Favorite>>();

  @override
  ListenableState<EntityState<List<Favorite>>> get favoritesState => _favoritesState;

  TestCoordinatorScreenWidgetModel(TestCoordinatorScreenModel model) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();

    getPlannedPlaces();
  }

  void getPlannedPlaces() {
    try {
      final places = model.getPlannedPlaces();
      _favoritesState.content(places);
    } on Exception catch (e) {
      _favoritesState.error(e);
    }
  }
}
