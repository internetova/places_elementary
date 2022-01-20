import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:places_elementary/assets/themes/themes.dart';
import 'package:places_elementary/features/app/di/app_scope.dart';
import 'package:places_elementary/features/navigation/domain/entity/app_coordinate.dart';
import 'package:places_elementary/features/navigation/service/coordinator.dart';
import 'package:places_elementary/features/settings/widgets/onboarding/setting_onboarding_model.dart';
import 'package:places_elementary/features/settings/widgets/onboarding/setting_onboarding_widget.dart';
import 'package:provider/provider.dart';

/// Контракт для SettingOnboardingWidget
abstract class ISettingOnboardingWidgetModel extends IWidgetModel {
  String get titleName;

  TextStyle? get titleStyle;

  Color? get buttonColor;

  void goOnboardingScreen();
}

/// Фабрика для создания SettingOnboardingWidgetModel
SettingOnboardingWidgetModel defaultSettingOnboardingWidgetModelFactory(BuildContext context) {
  final appDependencies = context.read<IAppScope>();
  final model = SettingOnboardingModel();
  final coordinator = appDependencies.coordinator;

  return SettingOnboardingWidgetModel(model, coordinator);
}

/// Виджет модель для SettingOnboardingWidget
class SettingOnboardingWidgetModel
    extends WidgetModel<SettingOnboardingWidget, SettingOnboardingModel>
    implements ISettingOnboardingWidgetModel {
  final Coordinator coordinator;

  /// Название настройки
  @override
  String get titleName => AppLocalizations.of(context)!.settingOnboardingTitle;

  /// Стиль названия настройки
  @override
  TextStyle? get titleStyle => Theme.of(context).primaryTextTheme.subtitle1;

  /// Цвет кнопки
  @override
  Color? get buttonColor => Theme.of(context).colorScheme.green;

  SettingOnboardingWidgetModel(
    SettingOnboardingModel model,
    this.coordinator,
  ) : super(model);

  /// Перейти на онбординг
  @override
  void goOnboardingScreen() {
    coordinator.navigate(context, AppCoordinate.onboardingScreen);
  }
}
