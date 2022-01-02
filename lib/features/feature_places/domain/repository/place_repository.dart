import 'package:places_elementary/features/feature_places/domain/entity/object_position.dart';
import 'package:places_elementary/features/feature_places/domain/entity/place.dart';
import 'package:places_elementary/features/feature_places/domain/entity/search_filter.dart';
import 'package:places_elementary/features/feature_places/domain/mappers/places_mapper.dart';
import 'package:places_elementary/features/feature_places/domain/repository/api/data/places_filter_request.dart';
import 'package:places_elementary/features/feature_places/domain/repository/api/service/place_api.dart';

/// Репозиторий для работы с местами
class PlacesRepository {
  final PlaceApi _client;

  PlacesRepository(this._client);

  /// Получить все места
  Future<List<Place>> getAllPlaces() async {
    return _client.getAllPlaces().then(mapListPlaces);
  }

  /// Получить места с фильтром
  /// [position] - текущая позиция пользователя или Красная площадь
  /// [filter] - радиус поиска и категории мест
  /// [keywords] - поиск в названии места, используется на экране поиска
  Future<List<Place>> getPlaces({
    ObjectPosition? position,
    SearchFilter? filter,
    String? keywords,
  }) async {
    return _client
        .getPlaces(
          PlacesFilterRequest(
            lat: position?.lat,
            lng: position?.lng,
            radius: filter?.radius,
            typeFilter: filter?.typeFilter,
            nameFilter: keywords,
          ),
        )
        .then(mapListPlaces);
  }

  /// Получить место по id
  Future<Place> getPlaceDetails(int placeId) async {
    return _client.getPlaceDetails(placeId).then(mapPlace);
  }
}
