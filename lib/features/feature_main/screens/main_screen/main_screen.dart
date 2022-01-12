import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places_elementary/features/common/widget_components/app_bottom_navigation_bar.dart';
import 'package:places_elementary/features/feature_favorites/screens/favorites_screen.dart';
import 'package:places_elementary/features/feature_main/screens/main_screen/main_screen_wm.dart';
import 'package:places_elementary/features/feature_map/screens/map_screen.dart';
import 'package:places_elementary/features/feature_places/screens/places_screen/places_screen.dart';
import 'package:places_elementary/features/feature_settings/screens/settings_screen.dart';

/// Главный экран MainScreen
class MainScreen extends ElementaryWidget<IMainScreenWidgetModel> {
  const MainScreen({
    Key? key,
    WidgetModelFactory wmFactory = defaultMainScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IMainScreenWidgetModel wm) {
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
