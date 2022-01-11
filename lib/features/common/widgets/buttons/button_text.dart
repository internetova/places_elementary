import 'package:flutter/material.dart';
import 'package:places_elementary/assets/themes/themes.dart';

/// Текстовая кнопка сливающаяся с фоном
/// на экране добавления нового места - Указать на карте, на странице с ошибками
class ButtonText extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double width;
  final double height;

  const ButtonText({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size(width, height),
        alignment: Alignment.center,
      ),
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .headline5!
            .copyWith(color: Theme.of(context).colorScheme.green),
      ),
    );
  }
}
