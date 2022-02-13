import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:places_elementary/assets/res/app_assets.dart';
import 'package:places_elementary/assets/themes/themes.dart';
import 'package:places_elementary/features/common/constants/app_sizes.dart';
import 'package:places_elementary/features/common/widgets/buttons/button_rounded.dart';
import 'package:places_elementary/features/common/widgets/buttons/icon_svg.dart';

/// Кнопка Построить маршрут - пройдено
class RouteFinishButton extends StatelessWidget {
  final VoidCallback buildRoute;

  const RouteFinishButton({Key? key, required this.buildRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Expanded(
          child: Container(
            height: AppSizes.heightBigButton,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(AppSizes.radiusCard),
              ),
              color: theme.primaryColorLight,
            ),
            child: Row(
              children: [
                const Expanded(
                  child: SizedBox.shrink(),
                ),
                IconSvg(
                  icon: AppAssets.icTick,
                  color: theme.colorScheme.green,
                ),
                AppSizes.sizedBoxW8,
                Text(
                  AppLocalizations.of(context)!.detailsButtonTitleBuildRouteFinish,
                  style: theme.textTheme.button!.copyWith(
                    color: theme.colorScheme.green,
                  ),
                ),
                const Expanded(
                  child: SizedBox.shrink(),
                ),
              ],
            ),
          ),
        ),
        AppSizes.sizedBoxW16,
        ButtonRounded(
          backgroundColor: theme.colorScheme.green,
          size: AppSizes.heightBigButton,
          radius: AppSizes.radiusCard,
          icon: AppAssets.icGo,
          iconColor: theme.colorScheme.white,
          onPressed: buildRoute,
        ),
      ],
    );
  }
}
