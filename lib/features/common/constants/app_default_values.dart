import 'package:flutter/material.dart';
import 'package:places_elementary/features/common/domain/entity/object_position.dart';

/// Дефолтные значения
class AppDefaultValues {
  /// Дефолтные значения Range слайдера в фильтре поиска min-max в метрах
  static const RangeValues rangeSliderFilterDefault = RangeValues(100.0, 10000.0);
  static const RangeValues rangeSliderFilterAfterReset = RangeValues(100.0, 3000.0);

  /// Дефолтные значения фильтра если ничего не сохранено в SharedPreferences
  static const double filterRadius = 10000.0; // в метрах
  static const List<String> filterTypesPlaces = [
    'park',
    'cafe',
    'other',
    'museum',
    'restaurant',
    'hotel',
  ];

  /// Красная площадь
  final defaultPosition = ObjectPosition(
    lat: 55.754194,
    lng: 37.620139,
  );

  AppDefaultValues._();
}