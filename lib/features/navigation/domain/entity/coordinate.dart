import 'package:flutter/widgets.dart';

/// Factory for building coordinates.
typedef CoordinateBuilder = Widget Function(BuildContext context, Object? data);

/// Basic coordinate representation.
abstract class Coordinate {
  final bool isUniqueCoordinate;
  final String value;

  const Coordinate({required this.value, required this.isUniqueCoordinate});

  @override
  String toString() => '$value isUnique: $isUniqueCoordinate';
}
