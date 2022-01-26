import 'package:places_elementary/features/common/domain/repository/objectbox_storage.dart';
import 'package:places_elementary/features/places/domain/entity/favorite.dart';
import 'package:places_elementary/features/places/domain/entity/object_position.dart';
import 'package:places_elementary/features/places/domain/entity/place.dart';
import 'package:places_elementary/features/places/domain/entity/search_filter.dart';
import 'package:places_elementary/features/places/domain/repository/places_repository.dart';

/// Сервис для работы с местами
class PlacesService {
  final PlacesRepository _repository;
  final ObjectboxStorage _objectboxStorage;

  PlacesService(this._repository, this._objectboxStorage);

  /// Получить все места
  Future<List<Place>> getAllPlaces() => _repository.getAllPlaces();

  /// Получить места с фильтром
  Future<List<Place>> getPlaces({
    required ObjectPosition position,
    required SearchFilter filter,
  }) =>
      _repository.getPlaces(
        position: position,
        filter: filter,
      );

  /// Поиск мест с фильтром и ключевыми словами
  Future<List<Place>> searchPlaces({
    required ObjectPosition position,
    required SearchFilter filter,
    required String keywords,
  }) =>
      _repository.getPlaces(
        position: position,
        filter: filter,
        keywords: keywords,
      );

  /// Получить место по id
  Future<Place> getPlaceDetails(int placeId) => _repository.getPlaceDetails(placeId);

  /// Место избранное?
  bool isFavorite(Place place) => _objectboxStorage.isFavorite(place);

  /// Добавить в избранные
  void addFavorites(Place place) => _objectboxStorage.addFavorites(place);

  /// Удалить из избранных
  void removeFavorites(Place place) => _objectboxStorage.removeFavorites(place);

  /// Получить список избранных Планирую
  List<Favorite> getPlannedPlaces() => _objectboxStorage.getPlannedPlaces();

  /// Получить список избранных Посетил
  List<Favorite> getVisitedPlaces() => _objectboxStorage.getVisitedPlaces();
}
