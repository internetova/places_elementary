import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:places_elementary/features/common/constants/app_sizes.dart';
import 'package:places_elementary/features/feature_places/constants/places_constants.dart';

/// Sliver appBar для PlacesScreen
/// Используем когда есть данные для отображения
class PlacesSliverAppBar extends StatelessWidget {
  const PlacesSliverAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: PlacesConstants.sliverAppBarHeight,
      pinned: true,
      elevation: 0,
      automaticallyImplyLeading: false,
      flexibleSpace: LayoutBuilder(builder: (context, constraints) {
        final verticalExtent = constraints.biggest.height;

        return FlexibleSpaceBar(
          centerTitle: true,
          title: AnimatedOpacity(
            duration: AppSizes.milliseconds300,
            opacity: verticalExtent == kToolbarHeight ? 1.0 : 0.0,
            child: Text(
              AppLocalizations.of(context)!.placesAppBarTitleSmall,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
          background: Container(
            color: Theme.of(context).primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  child: Text(
                    AppLocalizations.of(context)!.placesAppBarTitle,
                    style: Theme.of(context).textTheme.headline3!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
