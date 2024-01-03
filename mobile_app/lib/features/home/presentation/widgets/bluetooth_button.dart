import 'package:bluetooth_controller/features/core/presentation/widgets/bt_color.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BluetoothButton extends StatelessWidget {
  final bool enabled;
  final Function onPressed;
  const BluetoothButton({
    super.key,
    required this.enabled,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Container(
          width: 35.w,
          height: 35.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: enabled ? BtColor.blue : BtColor.yellow,
            boxShadow: BtShadow.medium,
          ),
          child: Icon(
            enabled ? Icons.bluetooth : Icons.bluetooth_disabled,
            size: 20.w,
            color: enabled ? BtColor.black : BtColor.white,
          )),
    );
  }
}
