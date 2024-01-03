import 'package:bluetooth_controller/features/controls/presentation/pages/controls_homepage.dart';
import 'package:bluetooth_controller/features/core/domain/repositories/bluetooth_service.dart';
import 'package:bluetooth_controller/features/core/presentation/blocs/bloc/bluetooth_bloc.dart';
import 'package:bluetooth_controller/features/core/presentation/widgets/bt_color.dart';
import 'package:bluetooth_controller/features/home/presentation/pages/homepage.dart';
import 'package:bluetooth_controller/features/settings/presentation/pages/settings_homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
    WidgetsBinding.instance.addPostFrameCallback((t) {
      BluetoothService().registerListener((bluetoothState) {
        context.read<BluetoothBloc>().add(UpdateStateEvent(bluetoothState));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: BtColor.white,
          boxShadow: BtShadow.medium,
        ),
        child: TabBar(
          unselectedLabelColor: BtColor.grey,
          labelColor: BtColor.blue,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorWeight: 1.w,
          controller: controller,
          tabs: [
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
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          Homepage(),
          ControlsHomepage(),
          SettingsHomepage(),
        ],
      ),
    );
  }
}
