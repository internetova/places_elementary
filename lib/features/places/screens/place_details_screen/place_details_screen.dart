import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places_elementary/features/places/screens/place_details_screen/place_details_wm.dart';

/// Экран подробности места
class PlaceDetailsScreen extends ElementaryWidget<IPlaceDetailsWidgetModel> {
  const PlaceDetailsScreen({
    Key? key,
    WidgetModelFactory wmFactory = defaultPlaceDetailsWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IPlaceDetailsWidgetModel wm) {
    return Container();
  }
}
