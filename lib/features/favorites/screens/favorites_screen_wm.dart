import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places_elementary/features/app/di/app_scope.dart';
import 'package:places_elementary/features/common/service/favorites_manager.dart';
import 'package:places_elementary/features/favorites/domain/entity/favorite.dart';
import 'package:places_elementary/features/favorites/screens/favorites_screen.dart';
import 'package:places_elementary/features/favorites/screens/favorites_screen_model.dart';
import 'package:places_elementary/features/navigation/service/coordinator.dart';
import 'package:places_elementary/features/places/coordinates/place_details_coordinate.dart';
import 'package:places_elementary/features/places/domain/entity/place.dart';
import 'package:provider/provider.dart';

abstract class IFavoritesScreenWidgetModel extends IWidgetModel {
  TabController get tabController;

  ListenableState<EntityState<List<Favorite>>> get plannedPlacesState;

  ListenableState<EntityState<List<Favorite>>> get visitedPlacesState;

  void removeFavorite(Place place);

  void goPlaceDetailsScreen(Place place);
}

FavoritesScreenWidgetModel defaultFavoritesScreenWidgetModelFactory(BuildContext context) {
  final appDependencies = context.read<IAppScope>();
  final model = FavoritesScreenModel(
    appDependencies.errorHandler,
    appDependencies.favoritesService,
    appDependencies.favoritesManager,
  );
  final favoritesManager = appDependencies.favoritesManager;
  final coordinator = appDependencies.coordinator;

  return FavoritesScreenWidgetModel(model, favoritesManager, coordinator);
}

/// Default widget model for FavoritesScreenWidget
class FavoritesScreenWidgetModel extends WidgetModel<FavoritesScreen, FavoritesScreenModel>
    with SingleTickerProviderWidgetModelMixin
    implements IFavoritesScreenWidgetModel {
  late final TabController _tabController;
  final _plannedPlacesState = EntityStateNotifier<List<Favorite>>();
  final _visitedPlacesState = EntityStateNotifier<List<Favorite>>();
  final Coordinator _coordinator;

  final FavoritesManager _favoritesManager;

  ListenableState<int> get favoritesState => _favoritesManager.favoritesState;

  @override
  TabController get tabController => _tabController;

  @override
  ListenableState<EntityState<List<Favorite>>> get plannedPlacesState => _plannedPlacesState;

  @override
  ListenableState<EntityState<List<Favorite>>> get visitedPlacesState => _visitedPlacesState;

  FavoritesScreenWidgetModel(
    FavoritesScreenModel model,
    this._favoritesManager,
    this._coordinator,
  ) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();

    favoritesState.addListener(getPlannedPlaces);

    _tabController = TabController(length: 2, vsync: this);

    /// обновляем данные при переходе на соответствующую вкладку
    _tabController.addListener(() {
      if (_tabController.index == 0) {
        getPlannedPlaces();
      } else {
        getVisitedPlaces();
      }
    });

    getVisitedPlaces();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void removeFavorite(Place place) {
    model.removeFavorites(place);
  }

  /// Перейти на детальный экран места
  @override
  void goPlaceDetailsScreen(Place place) {
    _coordinator.navigate(
      context,
      PlaceDetailsCoordinate.placeDetailsScreen,
      arguments: {
        'place': place,
      },
    );
  }

  void getPlannedPlaces() {
    try {
      final places = model.getPlannedPlaces();
      _plannedPlacesState.content(places);
    } on Exception catch (e) {
      _plannedPlacesState.error(e);
    }
  }

  void getVisitedPlaces() {
    try {
      final places = model.getVisitedPlaces();
      _visitedPlacesState.content(places);
    } on Exception catch (e) {
      _visitedPlacesState.error(e);
    }
  }
}
