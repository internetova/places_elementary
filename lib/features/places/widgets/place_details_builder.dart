import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places_elementary/features/common/constants/app_sizes.dart';
import 'package:places_elementary/features/favorites/domain/entity/favorite.dart';
import 'package:places_elementary/features/places/constants/places_constants.dart';
import 'package:places_elementary/features/places/domain/entity/card_type.dart';
import 'package:places_elementary/features/places/domain/entity/favorites_button_type.dart';
import 'package:places_elementary/features/places/domain/entity/place.dart';
import 'package:places_elementary/features/places/widgets/favorites_button/favorites_button_widget.dart';
import 'package:places_elementary/features/places/widgets/photo_slider/slider/photo_slider_widget.dart';
import 'package:places_elementary/features/places/widgets/place_details_content.dart';
import 'package:places_elementary/features/places/widgets/plan_button_builder.dart';
import 'package:places_elementary/features/places/widgets/route_button_builder.dart';

/// Детали места
class PlaceDetailsBuilder extends StatelessWidget {
  final Place place;
  final ListenableState<Favorite?> favoriteState;
  final VoidCallback goBack;
  final VoidCallback buildRoute;
  final CardType transitionFrom;

  const PlaceDetailsBuilder({
    Key? key,
    required this.place,
    required this.favoriteState,
    required this.buildRoute,
    required this.goBack,
    required this.transitionFrom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: PlacesConstants.imageSliderHeight,
            flexibleSpace: SizedBox(
              width: double.infinity,
              height: PlacesConstants.imageSliderHeight,
              child: Hero(
                tag: transitionFrom == CardType.search
                    ? PlacesConstants.tagFromSearch + place.urls.first
                    : PlacesConstants.tagFromFavorites + place.urls.first,
                child: PhotoSliderWidget(place.urls),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
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
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
