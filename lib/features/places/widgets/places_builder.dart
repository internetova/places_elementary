import 'package:flutter/material.dart';
import 'package:places_elementary/features/common/constants/app_sizes.dart';
import 'package:places_elementary/features/places/domain/entity/place.dart';
import 'package:places_elementary/features/places/widgets/place_card.dart';

typedef FutureVoidCallback = Future<void> Function();

class PlacesBuilder extends StatelessWidget {
  final List<Place> data;
  final FutureVoidCallback refreshPlaces;

  const PlacesBuilder({
    Key? key,
    required this.data,
    required this.refreshPlaces,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: refreshPlaces,
      child: ListView.builder(
        itemBuilder: (_, index) => Padding(
          padding: EdgeInsets.fromLTRB(
            AppSizes.paddingStandard,
            index == 0 ? AppSizes.paddingStandard * 2 : 0,
            AppSizes.paddingStandard,
            AppSizes.paddingStandard,
          ),
          child: PlaceCard(
            place: data[index],
          ),
        ),
        itemCount: data.length,
      ),
    );
  }
}
