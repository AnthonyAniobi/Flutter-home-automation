import 'package:bluetooth_controller/features/core/presentation/pages/app_nav_page.dart';
import 'package:bluetooth_controller/features/core/presentation/widgets/bt_color.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bluetooth Controller',
      themeMode: ThemeMode.light,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: BtColor.blue),
        // useMaterial3: true,
        fontFamily: "FoundersGrotesk",
      ),
      home: AppNavPage(),
    );
  }
}
