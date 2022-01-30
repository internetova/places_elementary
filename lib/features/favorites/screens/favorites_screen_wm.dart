import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places_elementary/features/app/di/app_scope.dart';
import 'package:places_elementary/features/favorites/screens/favorites_screen.dart';
import 'package:places_elementary/features/favorites/screens/favorites_screen_model.dart';
import 'package:provider/provider.dart';

abstract class IFavoritesScreenWidgetModel extends IWidgetModel {
}

FavoritesScreenWidgetModel defaultFavoritesScreenWidgetModelFactory(BuildContext context) {
  final appDependencies = context.read<IAppScope>();
  final model = FavoritesScreenModel(appDependencies.errorHandler);

  return FavoritesScreenWidgetModel(model);
}


/// Default widget model for FavoritesScreenWidget
class FavoritesScreenWidgetModel extends WidgetModel<FavoritesScreen, FavoritesScreenModel>
    implements IFavoritesScreenWidgetModel {

  FavoritesScreenWidgetModel(FavoritesScreenModel model) : super(model);
}
