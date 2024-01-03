import 'package:bluetooth_controller/features/core/presentation/widgets/bt_text.dart';
import 'package:flutter/material.dart';

class ControlsHomepage extends StatelessWidget {
  const ControlsHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BtText.sp18('Custom Controls'),
      ),
    );
  }
}
