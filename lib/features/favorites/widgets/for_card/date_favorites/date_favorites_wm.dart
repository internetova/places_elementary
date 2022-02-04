import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:places_elementary/assets/themes/themes.dart';
import 'package:places_elementary/features/app/di/app_scope.dart';
import 'package:places_elementary/features/common/service/favorites_manager.dart';
import 'package:places_elementary/features/favorites/domain/entity/favorite.dart';
import 'package:places_elementary/features/favorites/domain/entity/favorite_type.dart';
import 'package:places_elementary/features/favorites/widgets/for_card/date_favorites/date_favorites_model.dart';
import 'package:places_elementary/features/favorites/widgets/for_card/date_favorites/date_favorites_widget.dart';
import 'package:provider/provider.dart';

abstract class IDateFavoritesWidgetModel extends IWidgetModel {
  ListenableState<DateTime?> get dateState;

  String get dateText;

  TextStyle? get style;
}

DateFavoritesWidgetModel defaultDateFavoritesWidgetModelFactory(BuildContext context) {
  final appDependencies = context.read<IAppScope>();
  final model = DateFavoritesModel(
    appDependencies.errorHandler,
    appDependencies.favoritesService,
  );

  return DateFavoritesWidgetModel(model, appDependencies.favoritesManager);
}

/// Default widget model for DateFavoritesWidget
class DateFavoritesWidgetModel extends WidgetModel<DateFavoritesWidget, DateFavoritesModel>
    implements IDateFavoritesWidgetModel {
  final FavoritesManager _favoritesManager;
  late final StateNotifier<DateTime?> _dateState;
  late final Favorite _favorite;
  late final AppLocalizations? _appLocalizations;
  late final ThemeData _theme;

  ListenableState<int?> get changedDateState => _favoritesManager.changedDateState;

  ListenableState<int> get needUpdateDateState => _favoritesManager.needUpdateDateState;

  @override
  String get dateText => _favorite.favoriteType == FavoriteType.planned
      ? _appLocalizations!.favoritesDatePlanned
      : _appLocalizations!.favoritesDateVisited;

  @override
  TextStyle? get style => _favorite.favoriteType == FavoriteType.planned
      ? _theme.textTheme.bodyText2?.copyWith(color: _theme.colorScheme.green)
      : _theme.textTheme.bodyText2;

  @override
  ListenableState<DateTime?> get dateState => _dateState;

  DateFavoritesWidgetModel(DateFavoritesModel model, this._favoritesManager) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();

    _favorite = widget.favorite;
    _dateState = StateNotifier<DateTime?>(initValue: _favorite.date);
    _appLocalizations = AppLocalizations.of(context);
    _theme = Theme.of(context);

    needUpdateDateState.addListener(updateDate);
  }

  void updateDate() {
    if (changedDateState.value != null && changedDateState.value == _favorite.place.id) {
      final newFavorite = model.getFavorite(changedDateState.value!);
      _dateState.accept(newFavorite.date);
    }
  }
}
