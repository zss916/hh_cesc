import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastService {
  static final ToastService instance = ToastService._();

  ToastService._();

  void show(
    String message, {
    int duration = 2,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: duration == 1 ? Toast.LENGTH_SHORT : Toast.LENGTH_LONG,
      gravity: kIsWeb ? ToastGravity.CENTER : null,
      timeInSecForIosWeb: duration,
      fontSize: 14.0,
    );
  }

  void showTop(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: kIsWeb ? ToastGravity.TOP : null,
      timeInSecForIosWeb: 2,
      fontSize: 14.0,
    );
  }

  void showBottom(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: kIsWeb ? ToastGravity.BOTTOM : null,
      timeInSecForIosWeb: 2,
      fontSize: 14.0,
    );
  }

  void cancel() {
    Fluttertoast.cancel();
  }
}