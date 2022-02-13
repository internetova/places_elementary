import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:places_elementary/assets/res/app_assets.dart';
import 'package:places_elementary/features/common/widgets/buttons/button_back.dart';
import 'package:places_elementary/features/common/widgets/error/error_state_widget.dart';

/// Состояние ошибки при загрузке места
/// Нет интернета и все остальные ошибки
class PlaceDetailsError extends StatelessWidget {
  final VoidCallback goBack;

  const PlaceDetailsError({Key? key, required this.goBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ButtonBack(onPressed: goBack),
      ),
      body: ErrorStateWidget(
        icon: AppAssets.icNetworkException,
        header: AppLocalizations.of(context)!.error,
        text: AppLocalizations.of(context)!.errorSomethingsWrong,
      ),
    );
  }
}
