import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places_elementary/features/favorites/domain/entity/favorite.dart';
import 'package:places_elementary/features/places/widgets/details_buttons/plan_button.dart';
import 'package:places_elementary/features/places/widgets/details_schedule_button/details_plan_button_wm.dart';

/// Кнопка запланировать на детальном экране
class DetailsPlanButtonWidget extends ElementaryWidget<IDetailsPlanButtonWidgetModel> {
  final Favorite? favorite;

  const DetailsPlanButtonWidget({
    Key? key,
    required this.favorite,
    WidgetModelFactory wmFactory = defaultDetailsPlanButtonWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IDetailsPlanButtonWidgetModel wm) {
    return StateNotifierBuilder<DateTime?>(
      listenableState: wm.dateTimeState,
      builder: (_, date) => PlanButton(
        setReminder: wm.setReminder,
        date: date,
      ),
    );
  }
}
