import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places_elementary/assets/res/app_assets.dart';
import 'package:places_elementary/assets/strings/app_strings.dart';

/// BottomNavigationBar приложения
class AppBottomNavigationBar extends StatefulWidget {
  final int current;
  final ValueChanged<int> switchTab;

  const AppBottomNavigationBar({
    Key? key,
    required this.current,
    required this.switchTab,
  }) : super(key: key);

  @override
  State<AppBottomNavigationBar> createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.current,
      onTap: widget.switchTab,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            widget.current == 0 ? AppAssets.icListFull : AppAssets.icList,
            color: _itemColor(widget.current == 0),
          ),
          label: AppStrings.emptyString,
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            widget.current == 1 ? AppAssets.icMapFull : AppAssets.icMap,
            color: _itemColor(widget.current == 1),
          ),
          label: AppStrings.emptyString,
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            widget.current == 2 ? AppAssets.icHeartFull : AppAssets.icHeart,
            color: _itemColor(widget.current == 2),
          ),
          label: AppStrings.emptyString,
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            widget.current == 3 ? AppAssets.icSettingsFull : AppAssets.icSettings,
            color: _itemColor(widget.current == 3),
          ),
          label: AppStrings.emptyString,
        ),
      ],
    );
  }

  /// Берём цвет айтема из темы
  Color? _itemColor(bool current) {
    return current
        ? Theme.of(context).bottomNavigationBarTheme.selectedItemColor
        : Theme.of(context).bottomNavigationBarTheme.unselectedItemColor;
  }
}
