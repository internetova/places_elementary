import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places_elementary/features/feature_places/domain/entity/place.dart';
import 'package:places_elementary/features/feature_places/screens/places_screen/places_screen_wm.dart';
import 'package:places_elementary/features/feature_places/widgets/place_card.dart';
import 'package:places_elementary/features/feature_places/widgets/places_loader.dart';

/// Экран PlacesScreen
class PlacesScreen extends ElementaryWidget<IPlacesScreenWidgetModel> {
  const PlacesScreen({
    Key? key,
    WidgetModelFactory wmFactory = defaultPlacesScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IPlacesScreenWidgetModel wm) {
    return Scaffold(
      body: SafeArea(
        child: EntityStateNotifierBuilder<List<Place>>(
          listenableEntityState: wm.placesState,
          loadingBuilder: (_, __) {
            return const PlacesLoader();
          },
          errorBuilder: (_, __, ___) {
            return const Center(
              child: Text('errorBuilder'),
            );
          },
          builder: (_, data) {
            return ListView.builder(
              itemBuilder: (_, index) {
                final card = data![index];

                return PlaceCard(card: card);
              },
              itemCount: data!.length,
            );
          },
        ),
      ),
    );
  }
}
