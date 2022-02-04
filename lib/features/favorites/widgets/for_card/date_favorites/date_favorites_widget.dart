import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:places_elementary/features/common/constants/app_default_values.dart';
import 'package:places_elementary/features/favorites/domain/entity/favorite.dart';
import 'package:places_elementary/features/favorites/widgets/for_card/date_favorites/date_favorites_wm.dart';

/// Виджет строки с датой для карточки избранного
class DateFavoritesWidget extends ElementaryWidget<IDateFavoritesWidgetModel> {
  final Favorite favorite;

  const DateFavoritesWidget({
    Key? key,
    required this.favorite,
    WidgetModelFactory wmFactory = defaultDateFavoritesWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IDateFavoritesWidgetModel wm) {
    return StateNotifierBuilder<DateTime?>(
      listenableState: wm.dateState,
      builder: (_, date) => date == null
          ? const SizedBox.shrink()
          : Text(
              '${wm.dateText} ${DateFormat(AppDefaultValues.dateFormatPattern, AppDefaultValues.dateFormatLocale).format(date)}',
              style: wm.style,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
    );
  }
}
