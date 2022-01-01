import 'package:dio/dio.dart';
import 'package:places_elementary/features/feature_places/domain/repository/api/constants/place_api_urls.dart';
import 'package:places_elementary/features/feature_places/domain/repository/api/data/place_response.dart';
import 'package:places_elementary/features/feature_places/domain/repository/api/data/places_filter_request.dart';
import 'package:retrofit/retrofit.dart';

part 'place_client.g.dart';

/// Интерфейс API для работы с местами.
@RestApi()
abstract class PlaceApi {
  factory PlaceApi(Dio dio, {String baseUrl}) = _PlaceApi;

  /// Запросить все места
  @GET(PlaceApiUrls.places)
  Future<List<PlaceResponse>> getAllPlaces();

  /// Запросить места с фильтром
  @POST(PlaceApiUrls.places)
  Future<List<PlaceResponse>> getPlaces(@Body() PlacesFilterRequest filter);

  /// Получить место по id
  @GET(PlaceApiUrls.places)
  Future<PlaceResponse> getPlaceDetails(@Path() int placeId);
}