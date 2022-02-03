import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:places_elementary/features/common/constants/app_sizes.dart';
import 'package:places_elementary/features/places/constants/places_constants.dart';

/// AppBar для FavoritesScreen
class FavoritesAppBar extends StatelessWidget implements PreferredSizeWidget {
  final TabController tabController;

  @override
  Size get preferredSize => const Size.fromHeight(PlacesConstants.appBarHeight);

  const FavoritesAppBar({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(AppLocalizations.of(context)!.favoritesTitleScreen),
      backgroundColor: Colors.transparent,
      toolbarHeight: 156,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Padding(
          padding: const EdgeInsets.only(
            left: AppSizes.paddingStandard,
            right: AppSizes.paddingStandard,
            bottom: 30.0,
          ),
          child: Material(
            type: MaterialType.transparency,
            clipBehavior: Clip.antiAlias,
            borderRadius: BorderRadius.circular(40),
            child: Container(
              height: 40,
              color: Theme.of(context).primaryColorDark,
              child: TabBar(
                controller: tabController,
                tabs: [
                  Tab(
                    text: AppLocalizations.of(context)!.favoritesTabPlanned,
                  ),
                  Tab(
                    text: AppLocalizations.of(context)!.favoritesTabVisited,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      centerTitle: true,
      elevation: 0,
      automaticallyImplyLeading: false,
    );
  }
}
