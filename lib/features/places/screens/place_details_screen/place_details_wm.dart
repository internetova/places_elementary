import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places_elementary/features/app/app_coordinate.dart';
import 'package:places_elementary/features/app/di/app_scope.dart';
import 'package:places_elementary/features/favorites/domain/entity/favorite.dart';
import 'package:places_elementary/features/navigation/service/coordinator.dart';
import 'package:places_elementary/features/places/domain/entity/place.dart';
import 'package:places_elementary/features/places/screens/place_details_screen/place_details_model.dart';
import 'package:places_elementary/features/places/screens/place_details_screen/place_details_screen.dart';
import 'package:provider/provider.dart';


abstract class IPlaceDetailsWidgetModel extends IWidgetModel {
  ListenableState<EntityState<Place>> get placeDetailsState;

  ListenableState<Favorite?> get favoriteState;

  void goBack();
}

PlaceDetailsWidgetModel defaultPlaceDetailsWidgetModelFactory(BuildContext context) {
  final appDependencies = context.read<IAppScope>();
  final model = PlaceDetailsModel(
    appDependencies.errorHandler,
    appDependencies.placesService,
    appDependencies.favoritesService,
  );
  final coordinator = appDependencies.coordinator;

  return PlaceDetailsWidgetModel(model, coordinator);
}

/// Default widget model for PlaceDetailsScreen
class PlaceDetailsWidgetModel extends WidgetModel<PlaceDetailsScreen, PlaceDetailsModel>
    implements IPlaceDetailsWidgetModel {
  final Coordinator _coordinator;
  late final EntityStateNotifier<Place> _placeDetailsState;
  late final StateNotifier<Favorite?> _favoriteState;
  late final Place _place;

  @override
  ListenableState<EntityState<Place>> get placeDetailsState => _placeDetailsState;

  @override
  ListenableState<Favorite?> get favoriteState => _favoriteState;

  PlaceDetailsWidgetModel(PlaceDetailsModel model, this._coordinator) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();

    _init();
  }

  /// Вернуться назад
  @override
  void goBack() {
    _coordinator.navigate(
      context,
      AppCoordinate.tabsScreen,
      replaceRootCoordinate: true,
    );
  }

  Future<void> _init() async {
    _place = widget.place;
    _placeDetailsState = EntityStateNotifier<Place>()..loading();
    _favoriteState = StateNotifier<Favorite>()..accept(model.getFavorite(_place.id));

    try {
      final place = await model.getPlaceDetails(_place.id);
      _placeDetailsState.content(place);
    } on Exception catch (e) {
      _placeDetailsState.error(e);
    }
  }
}
