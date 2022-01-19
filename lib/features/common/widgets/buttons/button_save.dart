import 'package:flutter/material.dart';
import 'package:places_elementary/assets/themes/themes.dart';
import 'package:places_elementary/features/common/constants/app_sizes.dart';

/// Кнопка для отображения внизу страницы (FloatingActionButton)
/// Используется при сохранении данных формы, а также когда надо менять доступность и цвет кнопки:
/// - экран онбординга
/// - экран создания нового места
/// - экран выбора типа места
class ButtonSave extends StatefulWidget {
  final String title;
  final bool isButtonEnabled;
  final VoidCallback? onPressed;

  const ButtonSave({
    Key? key,
    required this.title,
    required this.isButtonEnabled,
    this.onPressed,
  }) : super(key: key);

  @override
  State<ButtonSave> createState() => _ButtonSaveState();
}

class _ButtonSaveState extends State<ButtonSave> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppSizes.paddingStandard, vertical: 8),
      width: double.infinity,
      child: FloatingActionButton.extended(
        onPressed: widget.onPressed,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppSizes.radiusButton),
          ),
        ),
        label: Text(
          widget.title,
          style: _buildButtonColorTitle(),
        ),
        backgroundColor: _getButtonColor(),
      ),
    );
  }

  /// Цвет кнопки в зависимости от её состояния
  Color? _getButtonColor() {
    return widget.isButtonEnabled
        ? Theme.of(context).floatingActionButtonTheme.backgroundColor
        : Theme.of(context).primaryColorLight;
  }

  /// Цвет названия кнопки в зависимости от её состояния
  TextStyle? _buildButtonColorTitle() {
    return widget.isButtonEnabled
        ? Theme.of(context).textTheme.button
        : Theme.of(context)
            .textTheme
            .button!
            .copyWith(color: Theme.of(context).colorScheme.inactiveBlack);
  }
}
