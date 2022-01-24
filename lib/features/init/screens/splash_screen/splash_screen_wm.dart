import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places_elementary/features/app/di/app_scope.dart';
import 'package:places_elementary/features/init/screens/splash_screen/splash_screen.dart';
import 'package:places_elementary/features/init/screens/splash_screen/splash_screen_model.dart';
import 'package:provider/provider.dart';

/// Контракт для SplashScreen
abstract class ISplashScreenWidgetModel extends IWidgetModel {
}

/// Фабрика для создания виджет модели
SplashScreenWidgetModel defaultSplashScreenWidgetModelFactory(BuildContext context) {
  final appDependencies = context.read<IAppScope>();
  final model = SplashScreenModel(appDependencies.errorHandler);

  return SplashScreenWidgetModel(model);
}

/// Виджет модель для SplashScreenWidget
class SplashScreenWidgetModel extends WidgetModel<SplashScreen, SplashScreenModel>
    implements ISplashScreenWidgetModel {

  SplashScreenWidgetModel(SplashScreenModel model) : super(model);
}
