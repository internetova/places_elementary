import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:places_elementary/assets/res/app_assets.dart';
import 'package:places_elementary/assets/themes/themes.dart';
import 'package:places_elementary/features/common/constants/app_sizes.dart';
import 'package:places_elementary/features/common/widgets/buttons/icon_svg.dart';

/// фон при смахивании карточки на экране Избранное
class CardDismissBackground extends StatelessWidget {
  const CardDismissBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AspectRatio(
      aspectRatio: 3 / 2,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizes.radiusCard),
          color: theme.errorColor,
        ),
        child: Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconSvg(
                  icon: AppAssets.icBucket,
                  color: theme.colorScheme.white,
                ),
                AppSizes.sizedBoxH8,
                Text(
                  AppLocalizations.of(context)!.favoritesDelete,
                  style: theme.primaryTextTheme.caption,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
