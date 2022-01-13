// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceResponse _$PlaceResponseFromJson(Map<String, dynamic> json) =>
    PlaceResponse(
      id: json['id'] as int,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      name: json['name'] as String,
      urls: (json['urls'] as List<dynamic>).map((e) => e as String).toList(),
      placeType: json['placeType'] as String,
      description: json['description'] as String,
      distance: (json['distance'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PlaceResponseToJson(PlaceResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lat': instance.lat,
      'lng': instance.lng,
      'name': instance.name,
      'urls': instance.urls,
      'placeType': instance.placeType,
      'description': instance.description,
      'distance': instance.distance,
    };
