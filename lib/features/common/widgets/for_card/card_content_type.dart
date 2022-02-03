import 'package:flutter/material.dart';

/// Элемент карточки места.
/// На картинке отображает тип карточки (музей, достопримечательность и т.п.)
class CardContentType extends StatelessWidget {
  final String type;

  const CardContentType({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      type.toLowerCase(),
      style: Theme.of(context).textTheme.subtitle2,
    );
  }
}
