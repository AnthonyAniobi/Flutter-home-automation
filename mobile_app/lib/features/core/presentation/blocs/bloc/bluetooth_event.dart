part of 'bluetooth_bloc.dart';

abstract class BluetoothEvent extends Equatable {
  const BluetoothEvent();

  @override
  List<Object> get props => [];
}

// class RegisterListenerEvent extends BluetoothEvent {}

class InitStateEvent extends BluetoothEvent {}

class UpdateStateEvent extends BluetoothEvent {
  final BluetoothState bluetoothState;
  const UpdateStateEvent(this.bluetoothState);
  @override
  List<Object> get props => [bluetoothState];
}

class EnableBluetoothEvent extends BluetoothEvent {}

class DisableBluetoothEvent extends BluetoothEvent {}

class GetPairedDeviceEvent extends BluetoothEvent {}

class ConnectBluetoothEvent extends BluetoothEvent {
  final String address;
  const ConnectBluetoothEvent(this.address);
  @override
  List<Object> get props => [address];
}

class SendMessageEvent extends BluetoothEvent {
  final String message;
  const SendMessageEvent(this.message);
  @override
  List<Object> get props => [message];
}
