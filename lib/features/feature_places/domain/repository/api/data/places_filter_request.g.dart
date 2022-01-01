// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'places_filter_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlacesFilterRequest _$PlacesFilterRequestFromJson(Map<String, dynamic> json) =>
    PlacesFilterRequest(
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
      radius: (json['radius'] as num?)?.toDouble(),
      typeFilter: (json['typeFilter'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      nameFilter: json['nameFilter'] as String?,
    );

Map<String, dynamic> _$PlacesFilterRequestToJson(
        PlacesFilterRequest instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
      'radius': instance.radius,
      'typeFilter': instance.typeFilter,
      'nameFilter': instance.nameFilter,
    };
