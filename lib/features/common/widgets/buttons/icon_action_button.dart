import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Кнопки действий для карточек поверх картинки
class IconActionButton extends StatelessWidget {
  final String icon;
  final double width;
  final double height;
  final Color color;
  final VoidCallback? onPressed;

  const IconActionButton({
    Key? key,
    required this.icon,
    this.onPressed,
    this.width = 24,
    this.height = 24,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 32,
      height: 32,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(4),
          elevation: 0,
        ),
        child: SvgPicture.asset(
          icon,
          width: width,
          height: height,
          color: color,
        ),
      ),
    );
  }
}
