import 'package:elementary/elementary.dart';

/// Т.к. для основной навигации используется IndexedStack, то при переходах по табам нижней
/// навигации обновлений экранов не происходит. Поэтому, пока буду учитывать это таким образом.
class FavoritesManager {
  /// Меняем список избранного на экране Избранное
   final favoritesState = StateNotifier<int>(initValue: 0);

  /// Только что удалено
  final removedState = StateNotifier<int?>();
}