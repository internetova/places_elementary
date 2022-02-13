import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places_elementary/features/favorites/domain/entity/favorite.dart';
import 'package:places_elementary/features/places/widgets/details_buttons/plan_button_disabled.dart';
import 'package:places_elementary/features/places/widgets/details_schedule_button/details_plan_button_widget.dart';

/// Билдер для кнопки планирования даты
class PlanButtonBuilder extends StatelessWidget {
  final ListenableState<Favorite?> favoriteState;

  const PlanButtonBuilder({Key? key, required this.favoriteState}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StateNotifierBuilder<Favorite?>(
      listenableState: favoriteState,
      builder: (_, favorite) => favorite == null
          ? const PlanButtonDisabled()
          : DetailsPlanButtonWidget(favorite: favorite),
    );
  }
}
