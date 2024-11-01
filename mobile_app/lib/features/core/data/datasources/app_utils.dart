import 'package:fluttertoast/fluttertoast.dart';

class AppUtils {
  static void showToast(String message) {
    Fluttertoast.showToast(msg: message);
  }
}
