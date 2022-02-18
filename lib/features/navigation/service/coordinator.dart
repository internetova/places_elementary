import 'package:flutter/material.dart';
import 'package:places_elementary/features/init/screens/splash_screen/splash_screen.dart';
import 'package:places_elementary/features/navigation/domain/entity/coordinate.dart';
import 'package:places_elementary/features/navigation/domain/entity/coordinate_key.dart';
import 'package:places_elementary/features/navigation/exception/coordinator_exceptions.dart';

/// Class that coordinates navigation for the whole app and provides
/// methods for navigation.
class Coordinator extends ChangeNotifier {
  final _coordinates = <Coordinate, _Route>{};

  final _pages = [
    const MaterialPage<void>(
      key: ValueKey('/init'),
      name: '/init',
      child: SplashScreen(),
    ),
  ];

  /// Initial screens coordinates.
  Coordinate? initialCoordinate;

  /// Coordinate list.
  /// Карта координат в рамках которой мы можем осуществлять навигацию
  Map<Coordinate, _Route> get coordinates => _coordinates;

  /// [Page]s list.
  /// Список открытых страниц, которые передаем в навигатор
  List<Page> get pages => List.of(_pages);

  /// Initial screens route.
  String? get initialRoute => _coordinates[initialCoordinate]?.path;

  /// Method for registering new coordinate.
  /// [name] - название префикса (группы) координат
  /// (путь состоит из префикса + название координаты)
  void registerCoordinates(
    String name,
    Map<Coordinate, CoordinateBuilder> coordinates,
  ) {
    _coordinates.addEntries(
      coordinates.entries.map(
        (entry) => MapEntry(
          entry.key,
          _Route('$name${entry.key}', entry.value),
        ),
      ),
    );
  }

  /// Main method for navigation.
  /// Работает только с зарегистрированными координатами, иначе бросаем ошибку
  // ignore: long-parameter-list
  void navigate(
    BuildContext context,
    Coordinate target, {
    Object? arguments,
    bool replaceCurrentCoordinate = false,
    bool replaceRootCoordinate = false,
  }) {
    final routeData = _getRouteDate(target);

    if (replaceRootCoordinate) {
      _pages.clear();
    } else if (replaceCurrentCoordinate) {
      _pages.removeLast();
    }
    _pages.add(
      _buildMaterialPage(
        context,
        routeData: routeData,
        arguments: arguments,
      ),
    );

    debugPrint(_pages.map((e) => e.name).toList().toString());

    notifyListeners();
  }

  /// Method for removing the topmost route.
  void pop() {
    assert(_pages.isNotEmpty);

    _pages.removeLast();

    debugPrint(_pages.map((e) => e.name).toList().toString());

    notifyListeners();
  }

  /// Method for deleting all routes except the first.
  void popUntilRoot() {
    assert(_pages.isNotEmpty);

    _pages.removeRange(1, _pages.length);

    debugPrint(_pages.map((e) => e.name).toList().toString());

    notifyListeners();
  }

  /// Method for deleting all routes except the first and inserting a new
  /// route in their place.
  void replaceUntilRoot(
    BuildContext context,
    Coordinate target, {
    Object? arguments,
  }) {
    assert(_pages.isNotEmpty);

    final routeData = _getRouteDate(target);

    _pages
      ..removeRange(1, _pages.length)
      ..add(
        _buildMaterialPage(
          context,
          routeData: routeData,
          arguments: arguments,
        ),
      );

    debugPrint(_pages.map((e) => e.name).toList().toString());

    notifyListeners();
  }

  MaterialPage<void> _buildMaterialPage(
    BuildContext context, {
    required _RouteData routeData,
    Object? arguments,
  }) {
    return MaterialPage<void>(
      key: routeData.isUnique
          ? ValueKey(routeData.route.path)
          : CoordinateKey(arguments: arguments, path: routeData.route.path),
      name: routeData.route.path,
      child: routeData.route.builder(context, arguments),
      arguments: arguments,
    );
  }

  /// По координате получить данные из зарегистрированных координат для построения MaterialPage
  _RouteData _getRouteDate(Coordinate target) {
    final path = _coordinates[target]?.path;

    if (path == null) {
      throw CoordinatorExceptions('Координата ${target.value} не зарегистрирована!');
    }

    return _RouteData(
      isUnique: target.isUniqueCoordinate,
      route: _coordinates[target]!,
    );
  }
}

class _Route {
  final String path;
  final CoordinateBuilder builder;

  const _Route(this.path, this.builder);

  @override
  String toString() {
    return path;
  }
}

/// Данные для построения экрана
/// [isUnique] - уникальный или нет
/// [route] - содержит путь и билдер
class _RouteData {
  final bool isUnique;
  final _Route route;

  const _RouteData({
    required this.isUnique,
    required this.route,
  });
}
