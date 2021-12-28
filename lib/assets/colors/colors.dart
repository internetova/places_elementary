import 'package:flutter/material.dart';

//ignore_for_file: public_member_api_docs
/// Цвета приложения
/// У темной и светлой темы в некоторых случаях будут общие цвета, поэтому определение цветов
/// сделала публичным
class AppColors {
  /// цвета и названия из макета фигмы
  static const colorWhite = Colors.white;
  static const colorBackground = Color(0xffF5F5F5);
  static const colorSecondary = Color(0xff3B3E5B);
  static const colorSecondary2 = Color(0xff7C7E92);
  static const colorInactiveBlack = Color.fromRGBO(124, 126, 146, 0.56);
  static const colorPicker = Color(0xFF8CC152);

  static const colorWhiteGreen = Color(0xff4CAF50);
  static const colorWhiteGreen2 = Color(0xff68B74E); // сплэш экран градиент
  static const colorWhiteYellow = Color(0xffFCDD3D);
  static const colorWhiteYellow2 = Color(0xffB8CC45); // сплэш экран градиент
  static const colorWhiteError = Color(0xffEF4343);
  static const colorWhiteMain = Color(0xff252849);

  static const colorBlackGreen = Color(0xff6ADA6F);
  static const colorBlackGreen2 = Color(0xff6CB84D); // сплэш экран градиент
  static const colorBlackYellow = Color(0xffFFE769);
  static const colorBlackYellow2 = Color(0xffBBCD45); // сплэш экран градиент
  static const colorBlackError = Color(0xffCF2A2A);
  static const colorBlackDark = Color(0xff1A1A20);
  static const colorBlackMain = Color(0xff21222C);

  ///светлая тема
  static const Color lightPrimaryColor = colorWhite;
  static const Color lightPrimaryColorLight = colorBackground;
  static const Color lightPrimaryColorDark = colorWhiteMain;
  static const Color lightOnPrimaryColor = colorSecondary;
  static const Color lightAccentColor = colorWhiteGreen;
  static const Color lightScaffoldBackgroundColor = colorWhite;
  static const Color lightErrorColor = colorWhiteError;
  static const Color lightBackgroundColor = colorInactiveBlack;
  static const Color lightSecondaryColor = colorSecondary;
  static const Color lightSecondaryVariant = colorSecondary2;
  static const Color lightDividerColor = colorInactiveBlack;
  static const Color lightIconColor = colorWhite;
  static const Color lightButtonColor = colorWhiteGreen;

  ///Тёмная тема
  static const Color darkPrimaryColor = colorBlackMain;
  static const Color darkPrimaryColorLight = colorBlackMain;
  static const Color darkPrimaryColorDark = colorBlackDark;
  static const Color darkOnPrimaryColor = colorWhite;
  static const Color darkAccentColor = colorBlackGreen;
  static const Color darkScaffoldBackgroundColor = colorBlackMain;
  static const Color darkErrorColor = colorBlackError;
  static const Color darkBackgroundColor = colorInactiveBlack;
  static const Color darkSecondaryColor = colorSecondary;
  static const Color darkSecondaryVariant = colorSecondary2;
  static const Color darkDividerColor = colorInactiveBlack;
  static const Color darkIconColor = colorWhite;
  static const Color darkButtonColor = colorBlackGreen;

  AppColors._();
}
