import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places_elementary/features/app/di/app_scope.dart';
import 'package:places_elementary/features/common/service/favorites_manager.dart';
import 'package:places_elementary/features/places/domain/entity/favorites_button_type.dart';
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
  final model = FavoritesButtonModel(
    appDependencies.errorHandler,
    appDependencies.placesService,
    appDependencies.favoritesManager,
  );
  final favoritesManager = appDependencies.favoritesManager;

  return FavoritesButtonWidgetModel(model, favoritesManager);
}

/// Default widget model for FavoritesButtonWidget
/// Записываем или удаляем в локальную базу избранные карточки
class FavoritesButtonWidgetModel extends WidgetModel<FavoritesButtonWidget, FavoritesButtonModel>
    implements IFavoritesButtonWidgetModel {
  late final StateNotifier<bool> _isFavState;
  late final Place _place;
  late final FavoritesButtonType _buttonType;

  final FavoritesManager _favoritesManager;

  ListenableState<int?> get lastPlaceChangedState => _favoritesManager.lastPlaceChangedState;

  @override
  ListenableState<bool> get isFavState => _isFavState;

  FavoritesButtonWidgetModel(
    FavoritesButtonModel model,
    this._favoritesManager,
  ) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();

    _init();

    lastPlaceChangedState.addListener(_updateIcon);
  }

  @override
  void switchFavorites() {
    if (_isFavState.value != null) {
      final isFav = _isFavState.value;

      if (isFav!) {
        model.removeFavorites(_place, _buttonType);
        _isFavState.accept(false);
      } else {
        model.addFavorites(_place, _buttonType);
        _isFavState.accept(true);
      }
    }
  }

  void _init() {
    _place = widget.place;
    _buttonType = widget.buttonType;

    final isFav = model.isFavorite(_place);
    _isFavState = StateNotifier<bool>(initValue: isFav);
  }

  void _updateIcon() {
    if (lastPlaceChangedState.value == _place.id) {
      final isFav = model.isFavorite(_place);
      _isFavState.accept(isFav);
    }
  }
}
