import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places_elementary/assets/res/app_assets.dart';
import 'package:places_elementary/features/common/widgets/buttons/icon_action_button.dart';
import 'package:places_elementary/features/favorites/domain/entity/favorite.dart';
import 'package:places_elementary/features/favorites/widgets/reminder_favorites_button/reminder_favorites_button_wm.dart';

/// Виджет для планирования посещения места
class ReminderFavoritesButton extends ElementaryWidget<IReminderFavoritesButtonWidgetModel> {
  final Favorite favorite;

  const ReminderFavoritesButton({
    Key? key,
    required this.favorite,
    WidgetModelFactory wmFactory = defaultReminderFavoritesButtonWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IReminderFavoritesButtonWidgetModel wm) {
    return IconActionButton(
      onPressed: wm.setReminder,
      icon: AppAssets.icCalendar,
    );
  }
}
