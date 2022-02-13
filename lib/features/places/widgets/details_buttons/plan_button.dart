import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:places_elementary/assets/res/app_assets.dart';
import 'package:places_elementary/assets/themes/themes.dart';
import 'package:places_elementary/features/common/constants/app_default_values.dart';
import 'package:places_elementary/features/common/constants/app_sizes.dart';
import 'package:places_elementary/features/common/widgets/buttons/icon_svg.dart';

/// Кнопка Запланировать для детальной страницы
class PlanButton extends StatelessWidget {
  final VoidCallback setReminder;
  final DateTime? date;

  const PlanButton({
    Key? key,
    required this.setReminder,
    this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextButton(
      onPressed: setReminder,
      style: TextButton.styleFrom(
        minimumSize: const Size.fromHeight(40),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconSvg(
            icon: AppAssets.icCalendar,
            color: date == null ? theme.colorScheme.primary : theme.colorScheme.green,
          ),
          AppSizes.sizedBoxW4,
          Text(
            date == null
                ? AppLocalizations.of(context)!.detailsButtonTitleToSchedule
                : DateFormat(AppDefaultValues.dateFormatPattern, AppDefaultValues.dateFormatLocale)
                    .format(date!),
            style: date == null
                ? theme.primaryTextTheme.bodyText2?.copyWith(color: theme.colorScheme.primary)
                : theme.primaryTextTheme.bodyText2?.copyWith(color: theme.colorScheme.green),
          ),
        ],
      ),
    );
  }
}
