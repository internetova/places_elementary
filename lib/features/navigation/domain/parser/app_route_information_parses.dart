import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:places_elementary/features/app/app_coordinate.dart';
import 'package:places_elementary/features/navigation/domain/entity/coordinate.dart';

/// [RouteInformationParser] implementation.
/// Passed in the routeInformationParser field in [MaterialApp.router].
class AppRouteInformationParser extends RouteInformationParser<Coordinate> {
  @override
  Future<Coordinate> parseRouteInformation(RouteInformation routeInformation) =>
      SynchronousFuture(AppCoordinate.initScreen);
}
