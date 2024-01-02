import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:bluetooth_controller/features/core/data/datasources/app_utils.dart';
import 'package:bluetooth_controller/features/core/data/models/bluetooth_model.dart';
import 'package:bluetooth_controller/features/core/domain/repositories/bluetooth_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

part 'bluetooth_event.dart';
part 'bluetooth_state.dart';

class BluetoothBloc extends Bloc<BluetoothEvent, BluetoothState> {
  BluetoothBloc() : super(BluetoothState(BluetoothModel.internal())) {
    on<ConnectBluetoothEvent>(_connectBluetooth);
    on<EnableBluetoothEvent>(_enableBluetooth);
    on<DisableBluetoothEvent>(_disableBluetooth);
    on<GetPairedDeviceEvent>(_getPairedDevices);
    on<SendMessageEvent>(_sendMessage);
  }

  Future _connectBluetooth(
      ConnectBluetoothEvent event, Emitter<BluetoothState> emit) async {
    final BluetoothConnection? connection =
        await BluetoothService().connect(event.address);
    if (connection != null) {
      emit(BluetoothState(state.model.copy(connection: connection)));
    } else {
      AppUtils.showToast('Failed to connect bluetooth');
    }
  }

  Future _enableBluetooth(
      EnableBluetoothEvent event, Emitter<BluetoothState> emit) async {
    final bluetoothState = await BluetoothService().enableBluetooth();
    emit(BluetoothState(state.model.copy(state: bluetoothState)));
  }

  Future _disableBluetooth(
      DisableBluetoothEvent event, Emitter<BluetoothState> emit) async {
    final bluetoothState = await BluetoothService().disableBluetooth();
    emit(BluetoothState(state.model.copy(state: bluetoothState)));
  }

  Future _getPairedDevices(
      GetPairedDeviceEvent event, Emitter<BluetoothState> emit) async {
    final pairedDevices = await BluetoothService().getPairedDevices();
    emit(BluetoothState(state.model.copy(pairedDevices: pairedDevices)));
  }

  Future _sendMessage(
      SendMessageEvent event, Emitter<BluetoothState> emit) async {
    bool sent = await BluetoothService()
        .sendMessage(state.model.connection!, event.message);
    if (sent) {
      // AppUtils.showToast('Message is sent');
    } else {
      AppUtils.showToast('Failed to send message');
    }
  }
}
