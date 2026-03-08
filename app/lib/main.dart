import 'package:flutter/material.dart';

import 'app_root.dart';

void main() {
  runApp(const RepeatoApp());
}

class RepeatoApp extends StatelessWidget {
  const RepeatoApp({super.key});

  @override
  Widget build(BuildContext context) {
    const seed = Color(0xFF1E7D68);

    return MaterialApp(
      title: 'Repeato',
      themeMode: ThemeMode.system,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: seed, brightness: Brightness.light),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: seed, brightness: Brightness.dark),
        useMaterial3: true,
      ),
      home: const AppRoot(),
    );
  }
}
