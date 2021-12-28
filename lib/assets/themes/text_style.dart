import 'package:flutter/painting.dart';

//ignore_for_file: public_member_api_docs

/// названия из фигмы
/// LargeTitle 32
/// Title 24
/// Subtitle 18
/// Text 16
/// Small 14
/// Super small 12

/// Стили текстов
abstract class AppTypography {
  static const textLargeTitle32Bold = TextStyle(
    fontSize: 32.0,
    height: 1.125,
    fontWeight: FontWeight.w700,
  );

  static const textTitle24Bold = TextStyle(
    fontSize: 24.0,
    height: 1.2,
    fontWeight: FontWeight.w700,
  );

  static const textSubtitle18Medium = TextStyle(
    fontSize: 18.0,
    height: 1.33,
    fontWeight: FontWeight.w500,
  );

  static const textText16Medium = TextStyle(
    fontSize: 16.0,
    height: 1.25,
    fontWeight: FontWeight.w500,
  );

  static const textText16Regular = TextStyle(
    fontSize: 16.0,
    height: 1.25,
    fontWeight: FontWeight.w400,
  );

  static const textSmall14Bold = TextStyle(
    fontSize: 14.0,
    height: 1.29,
    fontWeight: FontWeight.w700,
  );

  static const textSmall14Regular = TextStyle(
    fontSize: 14.0,
    height: 1.29,
    fontWeight: FontWeight.w400,
  );

  static const textButton = TextStyle(
    fontSize: 14.0,
    height: 1.29,
    letterSpacing: 0.3,
    fontWeight: FontWeight.w700,
  );

  static const textSuperSmall12Medium = TextStyle(
    fontSize: 12.0,
    height: 1.33,
    fontWeight: FontWeight.w500,
  );

  static const textSuperSmall12Regular = TextStyle(
    fontSize: 12.0,
    height: 1.33,
    fontWeight: FontWeight.w400,
  );

  static const textDebugMedium = TextStyle(
    fontSize: 20.0,
    height: 1.2,
    fontWeight: FontWeight.w500,
  );

  static const textDebug = TextStyle(
    fontSize: 16.0,
    height: 1.25,
    fontWeight: FontWeight.w400,
  );
}
