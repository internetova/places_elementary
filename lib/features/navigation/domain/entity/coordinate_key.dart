import 'package:flutter/material.dart';

/// Ключ для экрана
/// Хранит параметры координаты
class CoordinateKey extends LocalKey {
  final Object? arguments;
  final String? path;

  const CoordinateKey({
    required this.arguments,
    required this.path,
  });
}
