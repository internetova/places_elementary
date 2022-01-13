import 'package:places_elementary/assets/res/app_assets.dart';
import 'package:places_elementary/assets/strings/places_strings.dart';

/// Тип мест для работы в программе,
/// т.к. сервер отдаёт тип только в виде кода, например 'park'
/// создаём свой список типов мест с расшифровкой названия и иконкой,
/// а также метод приведения полученных данных с сервера к необходимым.
/// Будем использовать на странице с фильтром и при выводе названия 'park' -> Парк,
/// а также на странице создания нового места
class PlaceType {
  /// Категории для фильтра поиска
  /// на сервере:
  /// [ temple, monument, park, theatre, museum, hotel, restaurant, cafe, other ]
  static final List<PlaceType> _listPlaceTypes = [
    PlaceType(
      code: PlacesStrings.placeTypeCodeHotel,
      name: PlacesStrings.placeTypeNameHotel,
      icon: AppAssets.icHotel,
    ),
    PlaceType(
      code: PlacesStrings.placeTypeCodeRestaurant,
      name: PlacesStrings.placeTypeNameRestaurant,
      icon: AppAssets.icRestaurant,
    ),
    PlaceType(
      code: PlacesStrings.placeTypeCodeOther,
      name: PlacesStrings.placeTypeNameOther,
      icon: AppAssets.icParticular,
    ),
    PlaceType(
      code: PlacesStrings.placeTypeCodePark,
      name: PlacesStrings.placeTypeNamePark,
      icon: AppAssets.icPark,
    ),
    PlaceType(
      code: PlacesStrings.placeTypeCodeMuseum,
      name: PlacesStrings.placeTypeNameMuseum,
      icon: AppAssets.icMuseum,
    ),
    PlaceType(
      code: PlacesStrings.placeTypeCodeCafe,
      name: PlacesStrings.placeTypeNameCafe,
      icon: AppAssets.icCafe,
    ),
  ];

  final String code;
  final String name;
  final String icon;

  /// Если на сервере есть неизвестные типы помечаем карточки как other
  static String get placeTypeNameDefault => PlacesStrings.placeTypeNameOther;

  /// Получить все типы мест.
  /// Используется в фильтре и при добавлении нового места.
  static List<PlaceType> get getList => _listPlaceTypes;

  PlaceType({
    required this.code,
    required this.name,
    required this.icon,
  });

  /// Получить код типа (категории) места по названию
  static String getCode(String name) =>
      _listPlaceTypes.firstWhere((type) => type.name == name).code;
}
