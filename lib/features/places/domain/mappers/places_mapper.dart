import 'package:places_elementary/api/data/place_response.dart';
import 'package:places_elementary/features/places/domain/entity/place.dart';
import 'package:places_elementary/features/places/domain/entity/place_type.dart';

/// Маппер [Place] из [PlaceResponse]
Place mapPlace(PlaceResponse data) {
  return Place(
    id: data.id,
    lat: data.lat,
    lng: data.lng,
    name: data.name,
    urls: data.urls,
    placeType: mapPlaceType(data.placeType),
    description: data.description,
    distance: data.distance,
  );
}

/// Маппер park -> Парк
/// Сервер отдает только код без расшифровки, поэтому в программе вводим дополнительный
/// тип данных [PlaceType] с расшифровкой и иконкой для отображения на фильтре
String mapPlaceType(String placeTypeCode) {
  final result = PlaceType.getList.indexWhere((element) => element.code == placeTypeCode);

  return result == -1 ? PlaceType.placeTypeNameDefault : PlaceType.getList[result].name;
}

/// Маппер для списка мест
List<Place> mapListPlaces(List<PlaceResponse> data) => data.map(mapPlace).toList();
