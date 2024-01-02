import 'package:bluetooth_controller/features/core/presentation/widgets/bt_text.dart';
import 'package:flutter/material.dart';

class SettingsHomepage extends StatelessWidget {
  const SettingsHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BtText.sp18('Settings'),
      ),
    );
  }
}
