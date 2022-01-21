import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places_elementary/features/temp/screens/temp_screen/temp_screen_widget_model.dart';

/// Initialization screens (this can be a HomeScreen or SplashScreen for example).
class TempScreen extends ElementaryWidget<TempScreenWidgetModel> {
  /// Create an instance [TempScreen].
  const TempScreen({
    Key? key,
    WidgetModelFactory wmFactory = initScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(TempScreenWidgetModel wm) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('TempScreen'),
              const SizedBox(height: 10),
              const Text('Тут будет SplashScreen'),
              const SizedBox(height: 60),
              TextButton(
                onPressed: wm.goTabScreen,
                child: const Text('go TabScreen'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
