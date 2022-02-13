import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places_elementary/assets/themes/themes.dart';
import 'package:places_elementary/features/app/di/app_scope.dart';
import 'package:places_elementary/features/favorites/domain/entity/favorite.dart';
import 'package:places_elementary/features/places/widgets/details_schedule_button/details_plan_button_model.dart';
import 'package:places_elementary/features/places/widgets/details_schedule_button/details_plan_button_widget.dart';
import 'package:provider/provider.dart';

abstract class IDetailsPlanButtonWidgetModel extends IWidgetModel {
  ListenableState<Favorite?> get favoriteState;

  ListenableState<DateTime?> get dateTimeState;

  Future<void> setReminder();
}

DetailsPlanButtonWidgetModel defaultDetailsPlanButtonWidgetModelFactory(
  BuildContext context,
) {
  final appDependencies = context.read<IAppScope>();
  final model = DetailsPlanButtonModel(
    appDependencies.errorHandler,
    appDependencies.favoritesService,
    appDependencies.favoritesManager,
  );

  return DetailsPlanButtonWidgetModel(model);
}

/// Default widget model for DetailsScheduleButtonWidget
class DetailsPlanButtonWidgetModel
    extends WidgetModel<DetailsPlanButtonWidget, DetailsPlanButtonModel>
    implements IDetailsPlanButtonWidgetModel {
  late final Favorite? _favorite;
  final _favoriteState = StateNotifier<Favorite?>();
  final _dateTimeState = StateNotifier<DateTime?>();

  @override
  ListenableState<Favorite?> get favoriteState => _favoriteState;

  @override
  ListenableState<DateTime?> get dateTimeState => _dateTimeState;

  DetailsPlanButtonWidgetModel(
    DetailsPlanButtonModel model,
  ) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();

    _favorite = widget.favorite;
    _favoriteState.accept(_favorite);

    if (_favorite != null) {
      final date = _favorite!.date;

      _dateTimeState.accept(date);
    }
  }

  @override
  Future<void> setReminder() async {
    final fav = model.getFavorite(_favorite!.place.id);

    final initialDate = fav?.date != null
        ? DateTime(
            fav!.date!.year,
            fav.date!.month,
            fav.date!.day,
          )
        : DateTime.now();

    final initialTime = fav?.date != null
        ? TimeOfDay(
            hour: fav!.date!.hour,
            minute: fav.date!.minute,
          )
        : TimeOfDay.now();

    final dateTime = await _pickDate(initialDate);
    if (dateTime == null) return;

    final time = await _pickTime(initialTime);
    if (time == null) return;

    final newDateTime = DateTime(
      dateTime.year,
      dateTime.month,
      dateTime.day,
      time.hour,
      time.minute,
    );

    final favorite = Favorite(
      id: _favorite!.id,
      place: _favorite!.place,
      favoriteType: _favorite!.favoriteType,
      date: newDateTime,
    );

    model.setReminder(favorite);
    _dateTimeState.accept(newDateTime);
  }

  /// Установить дату о запланированном посещении места
  Future<DateTime?> _pickDate(DateTime initialDate) => showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 180)),
        builder: (context, child) {
          return Theme(
            data: setThemePicker(context),
            child: child!,
          );
        },
      );

  /// Установить время о запланированном посещении места
  Future<TimeOfDay?> _pickTime(TimeOfDay initialTime) => showTimePicker(
        context: context,
        initialTime: initialTime,
        builder: (context, child) {
          return Theme(
            data: setThemePicker(context),
            child: child!,
          );
        },
      );
}
