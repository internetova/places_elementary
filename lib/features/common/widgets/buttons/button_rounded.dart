import 'package:flutter/material.dart';
import 'package:places_elementary/features/common/widgets/buttons/icon_svg.dart';

/// Элемент интерфейса - небольшая закругленная квадратная или круглая кнопка,
/// используется в поле поиска, как кнопка назад с детальной страницы, на карте
class ButtonRounded extends StatelessWidget {
  final double size;
  final Color backgroundColor;
  final double radius;
  final String icon;
  final Color iconColor;
  final VoidCallback onPressed;
  final double? elevation;

  const ButtonRounded({
    Key? key,
    required this.size,
    required this.backgroundColor,
    required this.radius,
    required this.icon,
    required this.iconColor,
    required this.onPressed,
    this.elevation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tight(
        Size(size, size),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(radius),
            ),
          ),
          elevation: elevation,
        ),
        child: IconSvg(
          icon: icon,
          color: iconColor,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
