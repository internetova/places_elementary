import 'package:dio/dio.dart';
import 'package:places_elementary/api/constants/places_api_urls.dart';
import 'package:places_elementary/api/data/place_response.dart';
import 'package:places_elementary/api/data/places_filter_request.dart';

import 'package:retrofit/retrofit.dart';

part 'places_api.g.dart';

/// Интерфейс API для работы с местами.
@RestApi()
abstract class PlacesApi {
  factory PlacesApi(Dio dio, {String baseUrl}) = _PlacesApi;

  /// Запросить все места
  @GET(PlacesApiUrls.places)
  Future<List<PlaceResponse>> getAllPlaces();

  /// Запросить места с фильтром
  @POST(PlacesApiUrls.places)
  Future<List<PlaceResponse>> getPlaces(@Body() PlacesFilterRequest filter);

  /// Получить место по id
  @GET(PlacesApiUrls.places)
  Future<PlaceResponse> getPlaceDetails(@Path() int placeId);
}