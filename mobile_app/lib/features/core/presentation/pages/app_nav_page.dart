import 'package:bluetooth_controller/features/controls/presentation/pages/controls_homepage.dart';
import 'package:bluetooth_controller/features/home/presentation/pages/homepage.dart';
import 'package:bluetooth_controller/features/settings/presentation/pages/settings_homepage.dart';
import 'package:flutter/material.dart';

class AppNavPage extends StatefulWidget {
  const AppNavPage({super.key});

  @override
  State<AppNavPage> createState() => _AppNavPageState();
}

class _AppNavPageState extends State<AppNavPage>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    controller = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: TabBar(tabs: [
        Tab(
          icon: Icon(Icons.home),
          text: "Home",
        ),
        Tab(
          icon: Icon(Icons.gamepad),
          text: "Controls",
        ),
        Tab(
          icon: Icon(Icons.settings),
          text: "Settings",
        ),
      ]),
      body: TabBarView(
        children: [
          Homepage(),
          ControlsHomepage(),
          SettingsHomepage(),
        ],
      ),
    );
  }
}
