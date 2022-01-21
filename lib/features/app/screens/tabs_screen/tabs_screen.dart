import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places_elementary/features/app/screens/tabs_screen/tabs_screen_wm.dart';
import 'package:places_elementary/features/app/widgets/app_bottom_navigation_bar.dart';
import 'package:places_elementary/features/favorites/screens/favorites_screen.dart';
import 'package:places_elementary/features/map/screens/map_screen.dart';
import 'package:places_elementary/features/places/screens/places_screen/places_screen.dart';
import 'package:places_elementary/features/settings/screens/settings_screen.dart';

/// Главный экран TabsScreen
class TabsScreen extends ElementaryWidget<ITabsScreenWidgetModel> {
  const TabsScreen({
    Key? key,
    WidgetModelFactory wmFactory = defaultTabsScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(ITabsScreenWidgetModel wm) {
    return StateNotifierBuilder<int>(
      listenableState: wm.tabState,
      builder: (_, data) {
        return Scaffold(
          body: IndexedStack(
            index: data,
            children: const [
              PlacesScreen(),
              MapScreen(),
              FavoritesScreen(),
              SettingsScreen(),
            ],
          ),
          bottomNavigationBar: AppBottomNavigationBar(
            current: data ?? 0,
            switchTab: wm.switchTab,
          ),
        );
      },
    );
  }
}
