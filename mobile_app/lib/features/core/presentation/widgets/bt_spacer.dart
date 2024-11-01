import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BtSpacer {
  static SizedBox get w1 => SizedBox(width: 1.w);
  static SizedBox get w2 => SizedBox(width: 2.w);
  static SizedBox get w4 => SizedBox(width: 4.w);
  static SizedBox get w8 => SizedBox(width: 8.w);
  static SizedBox get w16 => SizedBox(width: 16.w);
  static SizedBox get w32 => SizedBox(width: 32.w);
  // height
  static SizedBox get h1 => SizedBox(height: 1.w);
  static SizedBox get h2 => SizedBox(height: 2.w);
  static SizedBox get h4 => SizedBox(height: 4.w);
  static SizedBox get h8 => SizedBox(height: 8.w);
  static SizedBox get h16 => SizedBox(height: 16.w);
  static SizedBox get h32 => SizedBox(height: 32.w);
  // fill
  static Spacer get fill => const Spacer();
}
