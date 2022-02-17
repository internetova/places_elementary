import 'package:flutter/material.dart';

/// Экран с незарегистрированной координатой для тестирования Координатора
class UnregisteredScreen extends StatelessWidget {
  const UnregisteredScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Незарегистрированный экран',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}
