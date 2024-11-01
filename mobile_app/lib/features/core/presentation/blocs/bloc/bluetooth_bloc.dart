import 'package:bloc/bloc.dart';
import 'package:bluetooth_controller/features/core/data/datasources/app_utils.dart';
import 'package:bluetooth_controller/features/core/data/models/bluetooth_model.dart';
import 'package:bluetooth_controller/features/core/domain/repositories/bluetooth_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

part 'bluetooth_event.dart';
part 'bluetooth_state.dart';

class BluetoothBloc extends Bloc<BluetoothEvent, BluetoothBlocState> {
  BluetoothBloc() : super(BluetoothBlocState(BluetoothModel.internal())) {
    on<ConnectBluetoothEvent>(_connectBluetooth);
    on<EnableBluetoothEvent>(_enableBluetooth);
    on<DisableBluetoothEvent>(_disableBluetooth);
    on<GetPairedDeviceEvent>(_getPairedDevices);
    on<SendMessageEvent>(_sendMessage);
    on<InitStateEvent>(_initState);
    on<UpdateStateEvent>(_updateState);
  }

  Future _connectBluetooth(
      ConnectBluetoothEvent event, Emitter<BluetoothBlocState> emit) async {
    final BluetoothConnection? connection =
        await BluetoothService().connect(event.address);
    if (connection != null) {
      emit(BluetoothBlocState(state.model.copy(connection: connection)));
    } else {
      AppUtils.showToast('Failed to connect bluetooth');
    }
  }

  Future _enableBluetooth(
      EnableBluetoothEvent event, Emitter<BluetoothBlocState> emit) async {
    final bluetoothState = await BluetoothService().enableBluetooth();
    emit(BluetoothBlocState(state.model.copy(state: bluetoothState)));
  }

  Future _disableBluetooth(
      DisableBluetoothEvent event, Emitter<BluetoothBlocState> emit) async {
    final bluetoothState = await BluetoothService().disableBluetooth();
    emit(BluetoothBlocState(state.model.copy(state: bluetoothState)));
  }

  Future _getPairedDevices(
      GetPairedDeviceEvent event, Emitter<BluetoothBlocState> emit) async {
    final pairedDevices = await BluetoothService().getPairedDevices();
    emit(BluetoothBlocState(state.model.copy(pairedDevices: pairedDevices)));
  }

  Future _sendMessage(
      SendMessageEvent event, Emitter<BluetoothBlocState> emit) async {
    bool sent = await BluetoothService()
        .sendMessage(state.model.connection!, event.message);
    if (sent) {
      // AppUtils.showToast('Message is sent');
    } else {
      AppUtils.showToast('Failed to send message');
    }
  }

  Future _updateState(
      UpdateStateEvent event, Emitter<BluetoothBlocState> emit) async {
    emit(BluetoothBlocState(state.model.copy(state: event.bluetoothState)));
  }

  Future _initState(
      InitStateEvent event, Emitter<BluetoothBlocState> emit) async {
    final bState = await BluetoothService().getState();
    emit(BluetoothBlocState(state.model.copy(state: bState)));
  }
}
