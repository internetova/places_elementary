import 'package:elementary/elementary.dart';
import 'package:places_elementary/features/places/domain/entity/place.dart';
import 'package:places_elementary/features/places/service/places_service.dart';

/// Модель для PlacesScreen
class PlacesScreenModel extends ElementaryModel {
  final PlacesService placesService;

  PlacesScreenModel(this.placesService);

  /// Получить все места
  Future<List<Place>> getAllPlaces() => placesService.getAllPlaces();
}
