import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';
import 'shared_pref.dart';

class Alerts {
  static Widget iconPreview(Widget child, BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      child: SizedBox(
        height: 80.h,
        width: 80.h,
        child: ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                barrierDismissible: true,
                builder: (BuildContext context) {
                  return Dialog(
                      insetPadding: EdgeInsets.all(50),
                      backgroundColor: Colors.white,
                      elevation: 1,
                      child: child);
                },
              );
            },
            style: Constants.buttonStyle1,
            child: Icon(
              Icons.visibility,
              size: 50.h,
            )),
      ),
    );

  }
  static showMessage(String message, BuildContext context) {
    // print("item deleted!");
    showToast(
      message,
      context: context,
      animation: StyledToastAnimation.scale,
      reverseAnimation: StyledToastAnimation.fade,
      position: StyledToastPosition.center,
      animDuration: Duration(seconds: 1),
      duration: Duration(seconds: 2),
      curve: Curves.elasticOut,
    );
  }
  // static dialogShow(Widget child, BuildContext context) {
  //   showDialog(
  //     context: context,
  //     barrierDismissible: true,
  //     builder: (BuildContext context) {
  //       return Dialog(
  //           insetPadding: EdgeInsets.all(50),
  //           backgroundColor: Colors.white,
  //           elevation: 1,
  //           child: child);
  //     },
  //   );
  //   }

  static showAlertYesNo(
      {required String title,
      required String content,
      required VoidCallback onPressYes,
      required VoidCallback onPressNo,
      required BuildContext context}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          // judul
          title: Text(title),
          // isi pesan
          content: Text(content),
          actions: [
            // tombel yes
            TextButton(
              onPressed: onPressYes,
              child: Text('Yes'),
            ),
            //tombol no
            TextButton(
              onPressed: onPressNo,
              child: Text('No'),
            ),
          ],
        );
      },
    );
  }

}
