import 'package:flutter/material.dart';
import 'package:places_elementary/features/feature_places/domain/entity/place.dart';
import 'package:places_elementary/features/feature_places/widgets/places_list.dart';
import 'package:places_elementary/features/feature_places/widgets/places_sliver_appbar.dart';

class PlacesBuilder extends StatelessWidget {
  final List<Place> data;

  const PlacesBuilder({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const PlacesSliverAppBar(),
            PlacesList(data: data),
          ],
        ),
      ),
    );
  }
}
