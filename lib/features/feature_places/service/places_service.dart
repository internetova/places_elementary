import 'package:places_elementary/features/feature_places/domain/entity/object_position.dart';
import 'package:places_elementary/features/feature_places/domain/entity/place.dart';
import 'package:places_elementary/features/feature_places/domain/entity/search_filter.dart';
import 'package:places_elementary/features/feature_places/domain/repository/place_repository.dart';

/// Сервис для работы с местами
class PlacesService {
  final PlacesRepository _repository;

  PlacesService(this._repository);

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
}
