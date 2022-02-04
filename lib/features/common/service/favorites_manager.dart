import 'package:elementary/elementary.dart';

/// Т.к. для основной навигации используется IndexedStack, то при переходах по табам нижней
/// навигации обновлений экранов не происходит. Поэтому, пока буду учитывать это таким образом.
class FavoritesManager {
  /// Меняем список избранного на экране Избранное
  final favoritesState = StateNotifier<int>(initValue: 0);

  /// Только что удалено
  /// [int] - id места
  final removedState = StateNotifier<int?>();

  /// Только что изменена дата посещения в избранных
  /// [int] - id места
  final changedDateState = StateNotifier<int?>();

  /// Надо обновить строку если была обновлена дата
  /// Т.к. на одной и той же карточке мы можем несколько раз менять дату, то будем учитывать
  /// дополнительно клики
  final needUpdateDateState = StateNotifier<int>(initValue: 0);
}
