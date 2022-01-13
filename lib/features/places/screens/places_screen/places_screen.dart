import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places_elementary/features/places/domain/entity/place.dart';
import 'package:places_elementary/features/places/screens/places_screen/places_screen_wm.dart';
import 'package:places_elementary/features/places/widgets/places_builder.dart';
import 'package:places_elementary/features/places/widgets/places_error.dart';
import 'package:places_elementary/features/places/widgets/places_loader.dart';

/// Экран PlacesScreen
class PlacesScreen extends ElementaryWidget<IPlacesScreenWidgetModel> {
  const PlacesScreen({
    Key? key,
    WidgetModelFactory wmFactory = defaultPlacesScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IPlacesScreenWidgetModel wm) {
    return EntityStateNotifierBuilder<List<Place>>(
      listenableEntityState: wm.placesState,
      loadingBuilder: (_, __) {
        return const PlacesLoader();
      },
      errorBuilder: (_, __, ___) {
        return const PlacesError();
      },
      builder: (_, data) {
        return PlacesBuilder(
          data: data ?? [],
          refreshPlaces: wm.refreshPlaces,
        );
      },
    );
  }
}
