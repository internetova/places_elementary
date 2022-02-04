import 'package:elementary/elementary.dart';
import 'package:places_elementary/features/favorites/domain/entity/favorite.dart';
import 'package:places_elementary/features/favorites/service/favorites_service.dart';

/// Default Elementary model for DateFavoritesWidget module
class DateFavoritesModel extends ElementaryModel {
  final FavoritesService favoritesService;

  DateFavoritesModel(
    ErrorHandler errorHandler,
    this.favoritesService,
  ) : super(errorHandler: errorHandler);

  /// Получить место
  /// После установки даты или ее изменения надо будет обновить строку с датой
  Favorite getFavorite(int id) => favoritesService.getFavorite(id);
}
