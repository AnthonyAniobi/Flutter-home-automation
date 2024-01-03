import 'package:equatable/equatable.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class BluetoothModel extends Equatable {
  final bool connected;
  final BluetoothConnection? connection;
  final bool available;
  final BluetoothState state;
  final List<BluetoothDevice> pairedDevices;

  BluetoothModel({
    required this.connected,
    required this.connection,
    required this.available,
    required this.state,
    required this.pairedDevices,
  });

  factory BluetoothModel.internal() {
    return BluetoothModel(
      connected: false,
      connection: null,
      available: false,
      state: BluetoothState.UNKNOWN,
      pairedDevices: [],
    );
  }

  BluetoothModel copy({
    bool? connected,
    BluetoothConnection? connection,
    bool? available,
    BluetoothState? state,
    List<BluetoothDevice>? pairedDevices,
  }) {
    return BluetoothModel(
      connected: connected ?? this.connected,
      connection: connection ?? this.connection,
      available: available ?? this.available,
      state: state ?? this.state,
      pairedDevices: pairedDevices ?? this.pairedDevices,
    );
  }

  @override
  List<Object?> get props =>
      [connected, connection, available, state, pairedDevices];

  bool get isConnected => connected && (connection?.isConnected ?? false);
}
