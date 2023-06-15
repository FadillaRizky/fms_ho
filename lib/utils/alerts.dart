import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:fms_ho/screen/filter_date.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

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

class BottomDialog {
  showBottomDialog(BuildContext context) {
    showGeneralDialog(
      barrierLabel: "showGeneralDialog",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.6),
      transitionDuration: const Duration(milliseconds: 400),
      context: context,
      pageBuilder: (context, _, __) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: _buildDialogContent(context),
        );
      },
      transitionBuilder: (_, animation1, __, child) {
        return SlideTransition(
          position: Tween(
            begin: const Offset(0, 1),
            end: const Offset(0, 0),
          ).animate(animation1),
          child: child,
        );
      },
    );
  }

  Widget _buildDialogContent(context) {
    return IntrinsicHeight(
      child: Container(
        width: double.maxFinite,
        clipBehavior: Clip.antiAlias,
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Material(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                  onTap: () {
                    String formatDate =
                        DateFormat('yyyy-MM-dd').format(DateTime.now());
                    Navigator.pop(context, formatDate);
                  },
                  child: Text("Hari Ini")),
              Divider(),
              Text("Kemarin"),
              Divider(),
              GestureDetector(
                  onTap: () {
                    String formatnow =
                        DateFormat('yyyy-MM-dd').format(DateTime.now());
                    String formatOneWeek = DateFormat('yyyy-MM-dd')
                        .format(DateTime.now().subtract(Duration(days: 7)));
                    List finalDate = [formatOneWeek,formatnow];
                    Navigator.pop(context,finalDate);
                    print("****");
                    print(finalDate);
                  },
                  child: Text("Minggu Ini")),
              Divider(),
              Text("Bulan Ini"),
              Divider(),
              GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => FilterDate()));
                  },
                  child: Text("Pilih Tanggal Sendiri")),
            ],
          ),
        ),
      ),
    );
  }

}
