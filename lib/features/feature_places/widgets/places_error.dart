import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:places_elementary/assets/res/app_assets.dart';
import 'package:places_elementary/features/common/widgets/error/error_state_widget.dart';
import 'package:places_elementary/features/feature_places/widgets/places_appbar.dart';

/// Состояние ошибки при загрузке мест
/// Нет интернета и все остальные ошибки
// TODO(sugina): пока не реализован ErrorHandler так
class PlacesError extends StatelessWidget {
  const PlacesError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PlacesAppBar(),
      body: ErrorStateWidget(
        icon: AppAssets.icNetworkException,
        header: AppLocalizations.of(context)!.error,
        text: AppLocalizations.of(context)!.errorSomethingsWrong,
        onPressed: () {},
      ),
    );
  }
}
