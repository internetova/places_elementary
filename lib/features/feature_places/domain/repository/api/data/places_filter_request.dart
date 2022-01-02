import 'package:freezed_annotation/freezed_annotation.dart';

part 'places_filter_request.g.dart';

/// Модель данных с параметрами фильтра. Все поля не обязательные,
/// но параметры "lat", "lat" и "radius" зависят друг от друга, поэтому
/// если указан один из них, то остальные два становятся обязательными
/// Чтобы в ответе получить дистанцию необходимо отправлять все поля!!
/// если геопозиция отключена, то выполняем поиск по всей базе по ключевому слову
/// [nameFilter] - ключевое слово для поиска по наименованию места
@JsonSerializable()
class PlacesFilterRequest {
  final double? lat;
  final double? lng;
  final double? radius;
  final List<String>? typeFilter;
  final String? nameFilter;

  PlacesFilterRequest({
    this.lat,
    this.lng,
    this.radius,
    this.typeFilter,
    this.nameFilter,
  });

  factory PlacesFilterRequest.fromJson(Map<String, dynamic> json) =>
      _$PlacesFilterRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PlacesFilterRequestToJson(this);
}
