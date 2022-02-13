import 'package:elementary/elementary.dart';
import 'package:places_elementary/features/common/service/favorites_manager.dart';
import 'package:places_elementary/features/favorites/domain/entity/favorite.dart';
import 'package:places_elementary/features/favorites/service/favorites_service.dart';

/// Default Elementary model for DetailsScheduleButton module
class DetailsPlanButtonModel extends ElementaryModel {
  final FavoritesService favoritesService;
  final FavoritesManager _favoritesManager;

  DetailsPlanButtonModel(
    ErrorHandler errorHandler,
    this.favoritesService,
    this._favoritesManager,
  ) : super(errorHandler: errorHandler);

  /// Установить дату и время посещения места
  void setReminder(Favorite favorite) {
    favoritesService.setReminder(favorite);

    _favoritesManager
      ..updateDate(favorite.place.id)
      ..updateDateOnFavoritesScreen();
  }

  /// Получить место
  /// После установки даты или ее изменения надо будет получить новую дату из базы данных
  Favorite? getFavorite(int id) => favoritesService.getFavorite(id);
}
