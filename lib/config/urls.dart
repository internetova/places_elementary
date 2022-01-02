import 'package:places_elementary/config/app_config.dart';
import 'package:places_elementary/config/environment/environment.dart';

/// Server urls.
abstract class Url {
  /// Prod proxy url.
  static String get prodProxyUrl => '';

  /// QA proxy url.
  static String get qaProxyUrl => '192.168.0.1';

  /// Dev proxy url.
  static String get devProxyUrl => '';

  /// TRest url.
  static String get testUrl => 'https://test-backend-flutter.surfstudio.ru';

  /// Prod url.
  static String get prodUrl => 'https://test-backend-flutter.surfstudio.ru';

  /// Dev url.
  static String get devUrl => 'https://test-backend-flutter.surfstudio.ru';

  /// Base url.
  static String get baseUrl => Environment<AppConfig>.instance().config.url;
}
