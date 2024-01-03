import 'package:flutter/material.dart';

class BtColor {
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color grey = Colors.grey;
  static const Color blue = Color(0xFF219ebc);
  static const Color darkBlue = Color(0xFF023047);
  static const Color lightBlue = Color(0xFF8ecae6);
  static const Color yellow = Color(0xFFffb700);
  static const Color orange = Color(0xFFfb8500);
}

class BtShadow {
  static List<BoxShadow> get light => [
        BoxShadow(
            offset: const Offset(2, 2),
            blurRadius: 5,
            color: Color(0x4F000000)),
      ];
  static List<BoxShadow> get medium => [
        BoxShadow(
            offset: const Offset(2, 2),
            blurRadius: 5,
            color: Color(0x8F000000)),
      ];
}
