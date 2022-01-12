import 'package:flutter/material.dart';

/// Экран с настройками (для теста)
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('SettingsScreen'),
      ),
    );
  }
}
