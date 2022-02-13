import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:places_elementary/assets/res/app_assets.dart';
import 'package:places_elementary/assets/themes/themes.dart';
import 'package:places_elementary/features/common/constants/app_sizes.dart';
import 'package:places_elementary/features/common/widgets/buttons/icon_svg.dart';

/// Кнопка Построить маршрут
class RouteButton extends StatelessWidget {
  final VoidCallback buildRoute;

  const RouteButton({Key? key, required this.buildRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextButton(
      onPressed: buildRoute,
      style: TextButton.styleFrom(
        backgroundColor: theme.colorScheme.green,
        minimumSize: const Size(double.infinity, AppSizes.heightBigButton),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppSizes.radiusCard),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const IconSvg(icon: AppAssets.icGo),
          AppSizes.sizedBoxW8,
          Text(
            AppLocalizations.of(context)!.detailsButtonTitleBuildRoute,
            style: theme.textTheme.button,
          ),
        ],
      ),
    );
  }
}
