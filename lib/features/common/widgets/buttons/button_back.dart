import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places_elementary/assets/res/app_assets.dart';

/// Кнопка назад со стрелкой на appbar
class ButtonBack extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  final VoidCallback onPressed;

  const ButtonBack({
    Key? key,
    this.color = Colors.white,
    this.backgroundColor = Colors.transparent,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor,
        minimumSize: const Size(24, 24),
        shape: const CircleBorder(),
        padding: EdgeInsets.zero,
      ),
      onPressed: onPressed,
      child: SvgPicture.asset(
        AppAssets.icArrow,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
    );
  }
}
