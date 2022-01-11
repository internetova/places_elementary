import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places_elementary/features/common/constants/app_sizes.dart';
import 'package:places_elementary/features/common/widgets/buttons/button_text.dart';

/// Виджет для отображения ошибок
/// [header] - заголовок
/// [text] - описание 1-2 строки
/// [icon] - svg иконка из дизайна
/// [onPressed] - если есть кнопка
/// [buttonTitle] - название кнопки
class ErrorStateWidget extends StatelessWidget {
  final String? header;
  final String text;
  final String? icon;
  final VoidCallback? onPressed;
  final String? buttonTitle;
  final double? buttonWidth;
  final double? buttonHeight;

  const ErrorStateWidget({
    this.header,
    required this.text,
    this.icon,
    this.onPressed,
    this.buttonTitle,
    this.buttonWidth,
    this.buttonHeight,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null)
            SvgPicture.asset(
              icon!,
              color: Theme.of(context).colorScheme.background,
              width: AppSizes.errorIconSize,
              height: AppSizes.errorIconSize,
            ),
          if (icon != null) const SizedBox(height: 32),
          if (header != null)
            Text(
              header!,
              style: Theme.of(context).primaryTextTheme.headline6,
              textAlign: TextAlign.center,
            ),
          const SizedBox(height: 16),
          Text(
            text,
            style: Theme.of(context).primaryTextTheme.bodyText2,
            textAlign: TextAlign.center,
          ),
          if (onPressed != null && buttonTitle != null) const SizedBox(height: 32),
          if (onPressed != null && buttonTitle != null)
            ButtonText(
              onPressed: onPressed!,
              title: buttonTitle!,
              width: buttonWidth ?? double.infinity,
              height: buttonHeight ?? AppSizes.heightBigButton,
            ),
        ],
      ),
    );
  }
}
