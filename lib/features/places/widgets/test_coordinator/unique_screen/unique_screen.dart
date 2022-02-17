import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places_elementary/features/common/constants/app_sizes.dart';
import 'package:places_elementary/features/common/widgets/buttons/button_text.dart';
import 'package:places_elementary/features/places/widgets/test_coordinator/unique_screen/unique_screen_wm.dart';

/// Экран с уникальной координатой для тестирования Координатора
class UniqueScreen extends ElementaryWidget<IUniqueScreenWidgetModel> {
  const UniqueScreen({
    Key? key,
    WidgetModelFactory wmFactory = defaultUniqueScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IUniqueScreenWidgetModel wm) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: wm.goBack,
          icon: const Icon(Icons.arrow_back),
          iconSize: 24,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Уникальный экран',
              style: wm.style,
            ),
            AppSizes.sizedBoxH40,
            ButtonText(
              title: 'Открой еще раз!',
              width: 200,
              height: 40,
              onPressed: wm.goUniqueScreen,
            ),
          ],
        ),
      ),
    );
  }
}
