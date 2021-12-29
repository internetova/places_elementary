//ignore_for_file: public_member_api_docs
import 'package:flutter/material.dart';

/// Дефолтные значения
class AppDefaultValues {
  /// Дефолтные значения Range слайдера в фильтре поиска min-max в метрах
  static const RangeValues rangeSliderFilterDefault = RangeValues(100.0, 10000.0);
  static const RangeValues rangeSliderFilterAfterReset = RangeValues(100.0, 3000.0);

  /// Дефолтные значения фильтра если ничего не сохранено в SharedPreferences
  static const double searchFilterRadius = 10000.0; // в метрах
  static const List<String> searchFilterTypeFilter = [
    'park',
    'cafe',
    'other',
    'museum',
    'restaurant',
    'hotel',
  ];

  AppDefaultValues._();
}