import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:places_elementary/features/common/constants/app_sizes.dart';
import 'package:places_elementary/features/feature_places/constants/places_constants.dart';

/// Обычный appBar для PlacesScreen
/// Используем когда на состоянии ошибки и загрузки
class PlacesAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(PlacesConstants.appBarHeight);

  const PlacesAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: PlacesConstants.appBarHeight,
      elevation: 0,
      automaticallyImplyLeading: false,
      bottom: PreferredSize(
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.paddingStandard),
            child: Text(
              AppLocalizations.of(context)!.placesAppBarTitleSmall,
              style: Theme.of(context).textTheme.headline3!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
          ),
        ),
        preferredSize: const Size.fromHeight(PlacesConstants.appBarHeight),
      ),
    );
  }
}
