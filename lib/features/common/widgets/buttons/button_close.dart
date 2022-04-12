import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places_elementary/assets/res/app_assets.dart';
import 'package:places_elementary/assets/themes/themes.dart';

/// Кнопка назад со стрелкой на appbar
class ButtonClose extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  final VoidCallback onPressed;

  const ButtonClose({
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
        AppAssets.icClose,
        color: Theme.of(context).colorScheme.green,
      ),
    );
  }
}
