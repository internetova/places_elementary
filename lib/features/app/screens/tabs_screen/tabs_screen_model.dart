import 'package:elementary/elementary.dart';
import 'package:places_elementary/features/common/service/app_settings_service.dart';

/// Модель для TabsScreen
class TabsScreenModel extends ElementaryModel {
  final AppSettingsService _appSettingsService;

  TabsScreenModel(
    ErrorHandler errorHandler,
    this._appSettingsService,
  ) : super(errorHandler: errorHandler);

  int? initData() {
    return _appSettingsService.tabsState.value?.data;
  }

  /// Сохраняем текущий tab
  Future<void> setMainTab(int currentTab) async {
    await _appSettingsService.setMainTab(currentTab);
  }
}
