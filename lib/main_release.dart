import 'package:places_elementary/config/app_config.dart';
import 'package:places_elementary/config/debug_options.dart';
import 'package:places_elementary/config/environment/build_types.dart';
import 'package:places_elementary/config/environment/environment.dart';
import 'package:places_elementary/config/urls.dart';
import 'package:places_elementary/runner.dart';

/// Main entry point of app.
void main() {
  Environment.init(
    buildType: BuildType.release,
    config: AppConfig(
      url: Url.prodUrl,
      proxyUrl: Url.prodProxyUrl,
      debugOptions: DebugOptions(),
    ),
  );

  run();
}
