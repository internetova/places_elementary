import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:places_elementary/features/places/domain/entity/search_filter.dart';

part 'app_settings.freezed.dart';

// TODO(sugina): удалить когда разнесу на части (иначе лишний раз ребилдится)
/// Настройки приложения:
/// - тема
/// - пройден ли онбординг
/// - фильтр для поиска места
/// - текущий таб в главном экране
@freezed
class AppSettings with _$AppSettings {
  const factory AppSettings({
    required bool themeIsDark,
    required bool onboardingIsComplete,
    required SearchFilter searchFilter,
    required int mainTab,
  }) = _AppSettings;
}
