import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class BluetoothService {
  static final BluetoothService _instance = BluetoothService._internal();
  BluetoothService._internal();
  factory BluetoothService() => _instance;
  // end of factory declaration
  FlutterBluetoothSerial _bluetooth = FlutterBluetoothSerial.instance;

  Future<BluetoothState> getState() async {
    return await FlutterBluetoothSerial.instance.state;
  }

  Future<BluetoothState> enableBluetooth() async {
    await FlutterBluetoothSerial.instance.requestEnable();
    BluetoothState state = await FlutterBluetoothSerial.instance.state;
    return state;
  }

  Future<BluetoothState> disableBluetooth() async {
    await FlutterBluetoothSerial.instance.requestDisable();
    BluetoothState state = await FlutterBluetoothSerial.instance.state;
    return state;
  }

  Future<List<BluetoothDevice>?> getPairedDevices() async {
    try {
      return await _bluetooth.getBondedDevices();
    } on PlatformException {
      return null;
    }
  }

  Future<BluetoothConnection?> connect(String address) async {
    try {
      return await BluetoothConnection.toAddress(address);
    } catch (e) {
      return null;
    }
  }

  void registerListener(Function(BluetoothState) event) {
    FlutterBluetoothSerial.instance.onStateChanged().listen(event);
  }

  // void scan() {
  //   FlutterBluetoothSerial.instance.
  // }

  Future<bool> sendMessage(
      BluetoothConnection connection, String message) async {
    try {
      connection.output.add(Uint8List.fromList(utf8.encode(message + "\r\n")));
      await connection.output.allSent;
      return true;
    } catch (e) {
      return false;
    }
  }
}
