import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places_elementary/features/app/di/app_scope.dart';
import 'package:places_elementary/features/places/domain/entity/place.dart';
import 'package:places_elementary/features/places/widgets/favorites_button/favorites_button_model.dart';
import 'package:places_elementary/features/places/widgets/favorites_button/favorites_button_widget.dart';
import 'package:provider/provider.dart';

abstract class IFavoritesButtonWidgetModel extends IWidgetModel {
  ListenableState<bool> get isFavState;

  void switchFavorites();
}

FavoritesButtonWidgetModel defaultFavoritesButtonWidgetModelFactory(BuildContext context) {
  final appDependencies = context.read<IAppScope>();
  final model = FavoritesButtonModel(appDependencies.errorHandler, appDependencies.placesService);

  return FavoritesButtonWidgetModel(model);
}

/// Default widget model for FavoritesButtonWidget
/// Записываем или удаляем в локальную базу избранные карточки
class FavoritesButtonWidgetModel extends WidgetModel<FavoritesButtonWidget, FavoritesButtonModel>
    implements IFavoritesButtonWidgetModel {
  late final StateNotifier<bool> _isFavState;
  late final Place _place;

  @override
  ListenableState<bool> get isFavState => _isFavState;

  FavoritesButtonWidgetModel(FavoritesButtonModel model) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();

    _init();
  }

  @override
  void switchFavorites() {
    if (_isFavState.value != null) {
      final isFav = _isFavState.value;

      if (isFav!) {
        model.removeFavorites(_place);
        _isFavState.accept(false);
      } else {
        model.addFavorites(_place);
        _isFavState.accept(true);
      }
    }
  }

  void _init() {
    _place = widget.place;
    final isFav = model.isFavorite(_place);
    _isFavState = StateNotifier<bool>(initValue: isFav);
  }
}
