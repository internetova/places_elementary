import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_request.g.dart';

//ignore_for_file: public_member_api_docs

/// Отправляем на сервер новое место
/// [lat] - широта
/// [lng] - долгота
/// [name] - имя
/// [urls] - список фото
/// [placeType] - тип места
/// [description] - описание
@JsonSerializable()
class PlaceRequest {
  final double lat;
  final double lng;
  final String name;
  final List<String> urls;
  final String placeType;
  final String description;

  PlaceRequest({
    required this.lat,
    required this.lng,
    required this.name,
    required this.urls,
    required this.placeType,
    required this.description,
  });

  factory PlaceRequest.fromJson(Map<String, dynamic> json) =>
      _$PlaceRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceRequestToJson(this);
}
