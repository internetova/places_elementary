import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:places_elementary/features/common/domain/entity/card_type.dart';

part 'place.freezed.dart';

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
    @Default(false) bool isFavorite,
    @Default(CardType.search) CardType cardType,
    DateTime? date,
  }) = _Place;
}
