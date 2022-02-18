import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places_elementary/features/places/domain/entity/place.dart';
import 'package:places_elementary/features/places/screens/place_details_screen/place_details_wm.dart';
import 'package:places_elementary/features/places/widgets/place_details_builder.dart';
import 'package:places_elementary/features/places/widgets/place_details_error.dart';
import 'package:places_elementary/features/places/widgets/place_details_loader.dart';

/// Экран подробности места
class PlaceDetailsScreen extends ElementaryWidget<IPlaceDetailsWidgetModel> {
  final Place place;

  const PlaceDetailsScreen({
    Key? key,
    required this.place,
    WidgetModelFactory wmFactory = defaultPlaceDetailsWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IPlaceDetailsWidgetModel wm) {
    return EntityStateNotifierBuilder<Place>(
      listenableEntityState: wm.placeDetailsState,
      loadingBuilder: (_, __) {
        return const PlaceDetailsLoader();
      },
      errorBuilder: (_, __, ___) {
        return PlaceDetailsError(goBack: wm.goBack);
      },
      builder: (_, data) {
        return PlaceDetailsBuilder(
          place: data!,
          favoriteState: wm.favoriteState,
          buildRoute: wm.buildRoute,
          goBack: wm.goBack,
          closeAll: wm.closeAll,
          goUniqueScreen: wm.goUniqueScreen,
          goUnregisteredScreen: wm.goUnregisteredScreen,
          goPlaceDetails: wm.goPlaceDetails,
        );
      },
    );
  }
}
