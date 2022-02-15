import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places_elementary/features/common/constants/app_sizes.dart';
import 'package:places_elementary/features/common/widgets/buttons/button_text.dart';
import 'package:places_elementary/features/favorites/domain/entity/favorite.dart';
import 'package:places_elementary/features/places/domain/entity/favorites_button_type.dart';
import 'package:places_elementary/features/places/domain/entity/place.dart';
import 'package:places_elementary/features/places/widgets/favorites_button/favorites_button_widget.dart';
import 'package:places_elementary/features/places/widgets/place_details_content.dart';
import 'package:places_elementary/features/places/widgets/plan_button_builder.dart';
import 'package:places_elementary/features/places/widgets/route_button_builder.dart';
import 'package:places_elementary/features/places/widgets/test_coordinator/test_coordinator_screen.dart';

/// Детали места
/// Временный вариант для тестирования работы координатора
class PlaceDetailsBuilder extends StatelessWidget {
  final Place place;
  final ListenableState<Favorite?> favoriteState;
  final VoidCallback goBack;
  final VoidCallback closeAll;
  final VoidCallback buildRoute;
  final ValueChanged<Place> goPlaceDetails;

  const PlaceDetailsBuilder({
    Key? key,
    required this.place,
    required this.favoriteState,
    required this.buildRoute,
    required this.goBack,
    required this.closeAll,
    required this.goPlaceDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: goBack,
          icon: const Icon(Icons.arrow_back),
          iconSize: 24,
        ),
        actions: [
          ButtonText(
            title: 'Закрыть все',
            width: 160,
            height: 40,
            onPressed: closeAll,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.paddingStandard,
            vertical: 24,
          ),
          child: Column(
            children: [
              PlaceDetailsContent(place: place),
              AppSizes.sizedBoxH24,
              RouteButtonBuilder(
                favoriteState: favoriteState,
                buildRoute: buildRoute,
              ),
              AppSizes.sizedBoxH24,
              const Divider(),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: PlanButtonBuilder(favoriteState: favoriteState),
                    ),
                    Expanded(
                      child: FavoritesButtonWidget(
                        place: place,
                        buttonType: FavoritesButtonType.big,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              AppSizes.sizedBoxH24,
              Text(
                'Смотрите другие интересные места',
                style: Theme.of(context).textTheme.headline5,
              ),
              AppSizes.sizedBoxH24,
              TestCoordinatorScreen(goPlaceDetails: goPlaceDetails),
              AppSizes.sizedBoxH24,
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
