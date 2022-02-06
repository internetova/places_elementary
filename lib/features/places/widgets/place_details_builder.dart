import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places_elementary/features/favorites/domain/entity/favorite.dart';
import 'package:places_elementary/features/places/domain/entity/place.dart';

/// Детали места
class PlaceDetailsBuilder extends StatelessWidget {
  final Place place;
  final ListenableState<Favorite?> favoriteState;

  const PlaceDetailsBuilder({
    Key? key,
    required this.place,
    required this.favoriteState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Text('${place.id} \n ${place.name}  \n ${place.description}'),
      ),
    );
  }
}
