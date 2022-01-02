import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_response.g.dart';

/// Ответ сервера - данные по интересному месту
/// [id] - ид места
/// [lat] - широта
/// [lng] - долгота
/// [name] - имя
/// [urls] - список фото
/// [placeType] - тип места
/// [description] - описание
/// [distance] - расстояние до локации юзера - шлёт сервер
@JsonSerializable()
class PlaceResponse {
  final int id;
  final double lat;
  final double lng;
  final String name;
  final List<String> urls;
  final String placeType;
  final String description;
  final double? distance;

  PlaceResponse({
    required this.id,
    required this.lat,
    required this.lng,
    required this.name,
    required this.urls,
    required this.placeType,
    required this.description,
    this.distance,
  });

  factory PlaceResponse.fromJson(Map<String, dynamic> json) =>
      _$PlaceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceResponseToJson(this);
}
