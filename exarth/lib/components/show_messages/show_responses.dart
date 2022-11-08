import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShowResponses {
  // static void feildFocusChange(
  //     BuildContext context, FocusNode currentNode, FocusNode nextNode) {
  //   currentNode.unfocus();
  //   FocusScope.of(context).requestFocus(nextNode);
  // }

  static toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: Color(0xff000000),
        textColor: Color(0xffffffff));
  }

  static void feilFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.decelerate,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          padding: EdgeInsets.all(15),
          borderRadius: BorderRadius.circular(20),
          flushbarPosition: FlushbarPosition.BOTTOM,
          message: message,
          backgroundColor: Colors.red,
          reverseAnimationCurve: Curves.easeInOut,
          positionOffset: 20,
          icon: Icon(
            Icons.error,
            size: 25,
            color: Colors.white,
          ),
          title: "Exalter",
          duration: Duration(seconds: 3),
        )..show(context));
  }

  static void flushBarSuccessMessage(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.decelerate,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          padding: EdgeInsets.all(15),
          borderRadius: BorderRadius.circular(20),
          flushbarPosition: FlushbarPosition.BOTTOM,
          message: message,
          backgroundColor: Colors.green,
          reverseAnimationCurve: Curves.easeInOut,
          positionOffset: 20,
          icon: Icon(
            Icons.error,
            size: 25,
            color: Colors.white,
          ),
          title: "Exalter",
          duration: Duration(seconds: 3),
        )..show(context));
  }

  static snackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.red,
      content: Text(message),
    ));
  }
}
