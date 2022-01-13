import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places_elementary/assets/res/app_assets.dart';

/// BottomNavigationBar приложения
class AppBottomNavigationBar extends StatelessWidget {
  final int current;
  final ValueChanged<int> switchTab;

  const AppBottomNavigationBar({
    Key? key,
    required this.current,
    required this.switchTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: current,
      onTap: switchTab,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            current == 0 ? AppAssets.icListFull : AppAssets.icList,
            color: _itemColor(context, current == 0),
          ),
          label: AppLocalizations.of(context)!.navPlacesLabel,
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            current == 1 ? AppAssets.icMapFull : AppAssets.icMap,
            color: _itemColor(context, current == 1),
          ),
          label: AppLocalizations.of(context)!.navMapLabel,
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            current == 2 ? AppAssets.icHeartFull : AppAssets.icHeart,
            color: _itemColor(context, current == 2),
          ),
          label: AppLocalizations.of(context)!.navFavoritesLabel,
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            current == 3 ? AppAssets.icSettingsFull : AppAssets.icSettings,
            color: _itemColor(context, current == 3),
          ),
          label: AppLocalizations.of(context)!.navSettingsLabel,
        ),
      ],
    );
  }

  /// Берём цвет айтема из темы
  Color? _itemColor(BuildContext context, bool current) {
    return current
        ? Theme.of(context).bottomNavigationBarTheme.selectedItemColor
        : Theme.of(context).bottomNavigationBarTheme.unselectedItemColor;
  }
}
