import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places_elementary/assets/themes/themes.dart';
import 'package:places_elementary/features/app/di/app_scope.dart';
import 'package:places_elementary/features/favorites/domain/entity/favorite.dart';
import 'package:places_elementary/features/favorites/widgets/reminder_favorites_button/reminder_favorites_button.dart';
import 'package:places_elementary/features/favorites/widgets/reminder_favorites_button/reminder_favorites_button_model.dart';
import 'package:provider/provider.dart';

abstract class IReminderFavoritesButtonWidgetModel extends IWidgetModel {
  Future<void> setReminder();
}

ReminderFavoritesButtonWidgetModel defaultReminderFavoritesButtonWidgetModelFactory(
  BuildContext context,
) {
  final appDependencies = context.read<IAppScope>();
  final model = ReminderFavoritesButtonModel(
    appDependencies.errorHandler,
    appDependencies.favoritesService,
    appDependencies.favoritesManager,
  );

  return ReminderFavoritesButtonWidgetModel(model);
}

/// Default widget model for ReminderFavoritesButtonWidget
class ReminderFavoritesButtonWidgetModel
    extends WidgetModel<ReminderFavoritesButton, ReminderFavoritesButtonModel>
    implements IReminderFavoritesButtonWidgetModel {
  late final Favorite _favorite;

  ReminderFavoritesButtonWidgetModel(ReminderFavoritesButtonModel model) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();

    _favorite = widget.favorite;
  }

  @override
  Future<void> setReminder() async {
    final fav = model.getFavorite(_favorite.place.id);

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
      id: _favorite.id,
      place: _favorite.place,
      favoriteType: _favorite.favoriteType,
      date: newDateTime,
    );

    model.setReminder(favorite);
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
