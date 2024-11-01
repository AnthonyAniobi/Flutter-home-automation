import 'package:bluetooth_controller/features/core/presentation/blocs/bloc/bluetooth_bloc.dart';
import 'package:bluetooth_controller/features/core/presentation/widgets/bt_color.dart';
import 'package:bluetooth_controller/features/core/presentation/widgets/bt_spacer.dart';
import 'package:bluetooth_controller/features/core/presentation/widgets/bt_text.dart';
import 'package:bluetooth_controller/features/home/presentation/widgets/bluetooth_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BtText.sp18('IOT App'),
      ),
      body: BlocBuilder<BluetoothBloc, BluetoothBlocState>(
        builder: (context, state) {
          return Column(
            children: [
              const Row(),
              BluetoothButton(
                enabled: state.model.state.isEnabled,
                onPressed: () {
                  if (state.model.state.isEnabled) {
                    context.read<BluetoothBloc>().add(DisableBluetoothEvent());
                  } else {
                    context.read<BluetoothBloc>().add(EnableBluetoothEvent());
                  }
                },
              ),
              BtSpacer.h8,
              if (state.model.state.isEnabled) ...[
                BtText.sp18('Bluetooth is On'),
                Expanded(
                  child: Builder(builder: (context) {
                    if (state.model.pairedDevices.isEmpty) {
                      return Column(
                        children: [
                          BtText.sp18('No Paired Devices'),
                          ElevatedButton(
                            onPressed: () {
                              context
                                  .read<BluetoothBloc>()
                                  .add(GetPairedDeviceEvent());
                            },
                            child: BtText.sp18('Search'),
                          )
                        ],
                      );
                    } else {
                      return ListView(
                        children: [
                          ...state.model.pairedDevices.map((device) {
                            return Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 4.w, vertical: 1.w),
                              decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: BtColor.grey, width: 0.5)),
                              ),
                              child: ListTile(
                                onTap: () {
                                  context.read<BluetoothBloc>().add(
                                      ConnectBluetoothEvent(device.address));
                                },
                                title: BtText.sp18(device.name ?? "Bluetooth"),
                                subtitle: device.isConnected
                                     ? BtText.sp16("connected").grey
                                    : null,
                                trailing:
                                    device.isBonded ? Icon(Icons.link) : null,
                              ),
                            );
                          })
                        ],
                      );
                    }
                  }),
                )
              ] else
                BtText.sp18('Please turn on the bluetooth'),
            ],
          );
        },
      ),
    );
  }
}
