import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:places_elementary/features/feature_places/domain/entity/card_type.dart';

part 'place.freezed.dart';

/// Места, отображаемые в программе
/// добавляем поля:
/// [isFavorite] - флаг для избранного
/// [cardType] - флаг для кнопок действий на карточке (на поиске, в избранном)
/// [date] - дата планирования или когда посетил, может быть null
/// сохраняем в локальной базе данных
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
