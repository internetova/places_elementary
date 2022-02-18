import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places_elementary/features/app/di/app_scope.dart';
import 'package:places_elementary/features/common/service/favorites_manager.dart';
import 'package:places_elementary/features/favorites/domain/entity/favorite.dart';
import 'package:places_elementary/features/navigation/service/coordinator.dart';
import 'package:places_elementary/features/places/coordinates/place_details_coordinate.dart';
import 'package:places_elementary/features/places/coordinates/unregistered_coordinate.dart';
import 'package:places_elementary/features/places/domain/entity/place.dart';
import 'package:places_elementary/features/places/screens/place_details_screen/place_details_model.dart';
import 'package:places_elementary/features/places/screens/place_details_screen/place_details_screen.dart';
import 'package:provider/provider.dart';

abstract class IPlaceDetailsWidgetModel extends IWidgetModel {
  ListenableState<EntityState<Place>> get placeDetailsState;

  ListenableState<Favorite?> get favoriteState;

  void goBack();

  void buildRoute();

  void goPlaceDetails(Place place);

  void closeAll();

  void goUniqueScreen();

  void goUnregisteredScreen();
}

PlaceDetailsWidgetModel defaultPlaceDetailsWidgetModelFactory(BuildContext context) {
  final appDependencies = context.read<IAppScope>();
  final model = PlaceDetailsModel(
    appDependencies.errorHandler,
    appDependencies.placesService,
    appDependencies.favoritesService,
  );
  final coordinator = appDependencies.coordinator;
  final favoritesManager = appDependencies.favoritesManager;

  return PlaceDetailsWidgetModel(model, coordinator, favoritesManager);
}

/// Default widget model for PlaceDetailsScreen
class PlaceDetailsWidgetModel extends WidgetModel<PlaceDetailsScreen, PlaceDetailsModel>
    implements IPlaceDetailsWidgetModel {
  final Coordinator _coordinator;
  late final EntityStateNotifier<Place> _placeDetailsState;
  late final Place _place;
  final _favoriteState = StateNotifier<Favorite?>();

  final FavoritesManager _favoritesManager;

  ListenableState<int> get lastDetailsChangedState => _favoritesManager.lastDetailsChangedState;

  @override
  ListenableState<EntityState<Place>> get placeDetailsState => _placeDetailsState;

  @override
  ListenableState<Favorite?> get favoriteState => _favoriteState;

  PlaceDetailsWidgetModel(
    PlaceDetailsModel model,
    this._coordinator,
    this._favoritesManager,
  ) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();

    _init();

    lastDetailsChangedState.addListener(_updateScheduleButton);
  }

  /// Вернуться назад
  @override
  void goBack() {
    _coordinator.pop();
  }

  /// Закрыть все страницы с одинаковым путем
  @override
  void closeAll() {
    _coordinator.popUntilRoot();
  }

  /// Построить маршрут
  @override
  void buildRoute() {
    debugPrint('-------- Открываем карту с координатами места ${_place.id}');
  }

  /// Перейти на детальный экран места
  @override
  void goPlaceDetails(Place place) {
    _coordinator.navigate(
      context,
      PlaceDetailsCoordinate.placeDetailsScreen,
      arguments: {
        'place': place,
      },
    );
  }

  /// Перейти на уникальный экран
  @override
  void goUniqueScreen() {
    _coordinator.navigate(
      context,
      PlaceDetailsCoordinate.uniqueScreen,
    );
  }

  /// Перейти на незарегистрированный экран
  @override
  void goUnregisteredScreen() {
    _coordinator.navigate(
      context,
      UnregisteredCoordinate.unregisteredScreen,
    );
  }

  Future<void> _init() async {
    _place = widget.place;
    _placeDetailsState = EntityStateNotifier<Place>()..loading();

    try {
      final place = await model.getPlaceDetails(_place.id);
      _placeDetailsState.content(place);

      final favorite = model.getFavorite(_place.id);
      _favoriteState.accept(favorite);
    } on Exception catch (e) {
      _placeDetailsState.error(e);
    }
  }

  /// Обновить кнопку запланировать
  void _updateScheduleButton() {
    final favorite = model.getFavorite(_place.id);
    _favoriteState.accept(favorite);
  }
}
