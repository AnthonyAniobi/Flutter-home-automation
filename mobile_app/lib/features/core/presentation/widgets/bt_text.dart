import 'package:bluetooth_controller/features/core/presentation/widgets/bt_color.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BtText {
  static Text sp22(String text) => Text(
        text,
        style: TextStyle(
          fontSize: 22.sp,
          fontWeight: FontWeight.w500,
          color: BtColor.black,
        ),
      );
  static Text sp19(String text) => Text(
        text,
        style: TextStyle(
          fontSize: 19.sp,
          fontWeight: FontWeight.w500,
          color: BtColor.black,
        ),
      );
  static Text sp20(String text) => Text(
        text,
        style: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          color: BtColor.black,
        ),
      );
  static Text sp18(String text) => Text(
        text,
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
          color: BtColor.black,
        ),
      );
  static Text sp17(String text) => Text(
        text,
        style: TextStyle(
          fontSize: 17.sp,
          fontWeight: FontWeight.w500,
          color: BtColor.black,
        ),
      );
  static Text sp16(String text) => Text(
        text,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: BtColor.black,
        ),
      );
  static Text sp15(String text) => Text(
        text,
        style: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.w400,
          color: BtColor.black,
        ),
      );
  static Text sp14(String text) => Text(
        text,
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: BtColor.black,
        ),
      );
}

extension HtTextExtensions on Text {
  Text copyWith({TextStyle? style, TextAlign? textAlign, int? maxLines}) {
    return Text(
      data ?? "",
      style: this.style?.merge(style),
      maxLines: maxLines ?? this.maxLines,
      textAlign: textAlign ?? this.textAlign,
    );
  }

  Text get white => copyWith(style: TextStyle(color: BtColor.white));
  Text get black => copyWith(style: TextStyle(color: BtColor.black));
  Text get grey => copyWith(style: TextStyle(color: BtColor.grey));
  Text get blue => copyWith(style: TextStyle(color: BtColor.blue));
  Text get orange => copyWith(style: TextStyle(color: BtColor.orange));
  Text get yellow => copyWith(style: TextStyle(color: BtColor.yellow));
  Text get centerText => copyWith(textAlign: TextAlign.center);
  Text get w400 =>
      copyWith(style: style?.copyWith(fontWeight: FontWeight.w400));
  Text get w500 =>
      copyWith(style: style?.copyWith(fontWeight: FontWeight.w500));
  Text get w600 =>
      copyWith(style: style?.copyWith(fontWeight: FontWeight.w600));
  Text get w700 =>
      copyWith(style: style?.copyWith(fontWeight: FontWeight.w700));
  Text setMaxLines(int lines) => copyWith(maxLines: lines);
  Text get strikeThrough =>
      copyWith(style: style?.copyWith(decoration: TextDecoration.lineThrough));
}
