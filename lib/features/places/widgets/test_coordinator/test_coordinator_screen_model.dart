import 'package:elementary/elementary.dart';
import 'package:places_elementary/features/favorites/domain/entity/favorite.dart';
import 'package:places_elementary/features/favorites/service/favorites_service.dart';

/// Default Elementary model for TestCoordinatorScreen module
class TestCoordinatorScreenModel extends ElementaryModel {
  final FavoritesService _favoritesService;

  TestCoordinatorScreenModel(
    ErrorHandler errorHandler,
    this._favoritesService,
  ) : super(errorHandler: errorHandler);

  /// Получить список избранных Планирую
  List<Favorite> getPlannedPlaces() => _favoritesService.getPlannedPlaces();
}
