import 'package:freezed_annotation/freezed_annotation.dart';

part 'place.freezed.dart';

/// Места, отображаемые в программе
@freezed
class Place with _$Place {
  const factory Place({
    required int id,
    required double lat,
    required double lng,
    required String name,
    required List<String> urls,
    required String placeType,
    required String description,
    double? distance,
  }) = _Place;
}
