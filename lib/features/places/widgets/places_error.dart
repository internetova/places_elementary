import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:places_elementary/assets/res/app_assets.dart';
import 'package:places_elementary/features/common/widgets/error/error_state_widget.dart';

/// Состояние ошибки при загрузке мест
/// Нет интернета и все остальные ошибки
class PlacesError extends StatelessWidget {
  const PlacesError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ErrorStateWidget(
        icon: AppAssets.icNetworkException,
        header: AppLocalizations.of(context)!.error,
        text: AppLocalizations.of(context)!.errorSomethingsWrong,
        onPressed: () {},
    );
  }
}
