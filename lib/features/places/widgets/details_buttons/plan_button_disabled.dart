import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:places_elementary/assets/res/app_assets.dart';
import 'package:places_elementary/features/common/constants/app_sizes.dart';
import 'package:places_elementary/features/common/widgets/buttons/icon_svg.dart';

/// Кнопка Запланировать для детальной страницы
class PlanButtonDisabled extends StatelessWidget {
  const PlanButtonDisabled({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextButton(
      onPressed: null,
      style: TextButton.styleFrom(
        minimumSize: const Size.fromHeight(40),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconSvg(
            icon: AppAssets.icCalendar,
            color: theme.colorScheme.background,
          ),
          AppSizes.sizedBoxW4,
          Text(
            AppLocalizations.of(context)!.detailsButtonTitleToSchedule,
            style: theme.primaryTextTheme.bodyText2,
          ),
        ],
      ),
    );
  }
}
