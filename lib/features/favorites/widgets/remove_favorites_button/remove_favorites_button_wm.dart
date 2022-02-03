import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places_elementary/features/app/di/app_scope.dart';
import 'package:places_elementary/features/favorites/widgets/remove_favorites_button/remove_favorites_button.dart';
import 'package:places_elementary/features/favorites/widgets/remove_favorites_button/remove_favorites_button_model.dart';
import 'package:places_elementary/features/places/domain/entity/place.dart';
import 'package:provider/provider.dart';

abstract class IRemoveFavoritesButtonWidgetModel extends IWidgetModel {
  void removeFavorite();
}

RemoveFavoritesButtonWidgetModel defaultRemoveFavoritesButtonWidgetModelFactory(
  BuildContext context,
) {
  final appDependencies = context.read<IAppScope>();
  final model = RemoveFavoritesButtonModel(
    appDependencies.errorHandler,
    appDependencies.favoritesService,
    appDependencies.favoritesManager,
  );

  return RemoveFavoritesButtonWidgetModel(model);
}

/// Default widget model for FavoritesButtonWidget
/// Записываем или удаляем в локальную базу избранные карточки
class RemoveFavoritesButtonWidgetModel
    extends WidgetModel<RemoveFavoritesButton, RemoveFavoritesButtonModel>
    implements IRemoveFavoritesButtonWidgetModel {
  late final Place _place;

  RemoveFavoritesButtonWidgetModel(RemoveFavoritesButtonModel model) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();

    _init();
  }

  @override
  void removeFavorite() {
    model.removeFavorites(_place);
  }

  void _init() {
    _place = widget.place;
  }
}
