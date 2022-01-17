import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:places_elementary/features/common/constants/app_sizes.dart';
import 'package:places_elementary/features/settings/widgets/onboarding/setting_onboarding_widget.dart';

/// Экран с настройками
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settingsAppBarTitle),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.paddingStandard,
          vertical: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            Divider(),
            SettingOnboardingWidget(),
            Divider(),
          ],
        ),
      ),
    );
  }
}
