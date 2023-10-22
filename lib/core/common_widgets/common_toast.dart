import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

abstract class CommonToast {
  static void showToast(String message, ){
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey.withOpacity(0.7),
        textColor: Colors.black,
        fontSize: 12.0
    );
  }
}
