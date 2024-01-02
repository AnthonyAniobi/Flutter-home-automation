part of 'bluetooth_bloc.dart';

class BluetoothState extends Equatable {
  final BluetoothModel model;
  const BluetoothState(this.model);

  @override
  List<Object> get props => [model];
}
