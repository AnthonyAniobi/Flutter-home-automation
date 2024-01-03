part of 'bluetooth_bloc.dart';

class BluetoothBlocState extends Equatable {
  final BluetoothModel model;
  const BluetoothBlocState(this.model);

  @override
  List<Object> get props => [model];
}
