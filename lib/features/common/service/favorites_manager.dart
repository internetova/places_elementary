import 'package:elementary/elementary.dart';

/// Т.к. для основной навигации используется IndexedStack, то при переходах по табам нижней
/// навигации обновлений экранов не происходит. А также нет обновлений при возврате с отдельных
/// страниц. Поэтому, пока буду учитывать это таким образом.
class FavoritesManager {
  /// Меняем список избранного на экране Избранное при изменении статуса любого места
  /// вне экрана Избранные
  final favoritesState = StateNotifier<int>(initValue: 0);

  /// Последнее измененное место - статус избранного
  /// Для изменения иконки на Главном экране если статус места изменили на других экранах
  /// [int] - id места
  final lastPlaceChangedState = StateNotifier<int?>();

  /// Меняем статус избранного только на детальной странице
  /// Для изменения кнопки планирования даты на детальном экране
  /// [int] - id места
  final lastDetailsChangedState = StateNotifier<int>(initValue: 0);

  /// Последнее измененное место - дата посещения
  /// Только что изменена дата посещения в избранных на экране Избранные
  /// [int] - id места
  final changedDateState = StateNotifier<int?>();

  /// Надо обновить строку если была обновлена дата
  /// Т.к. на одной и той же карточке мы можем несколько раз менять дату, то будем учитывать
  /// дополнительно клики
  final needUpdateDateState = StateNotifier<int>(initValue: 0);

  /// Обновить иконку на карточке на экране Места
  void updatePlaceIconOnPlacesScreen(int placeId) {
    lastPlaceChangedState
      ..accept(placeId)
      ..accept(null);
  }

  /// Обновить экран Избранное
  void updateFavoritesScreen() {
    final count = favoritesState.value;
    favoritesState.accept(count! + 1);
  }

  /// Обновить статус избранного на детальной странице для смены кнопки планирования
  void updateDetails() {
    final count = lastDetailsChangedState.value;
    lastDetailsChangedState.accept(count! + 1);
  }

  /// Обновить дату на карточке на экране Избранные
  void updateDate(int placeId) {
    changedDateState.accept(placeId);
  }

  /// Обновить экран Избранное при обновлении даты на любой карточке
  void updateDateOnFavoritesScreen() {
    final count = needUpdateDateState.value;
    needUpdateDateState.accept(count! + 1);
  }
}
