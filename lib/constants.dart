import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  static TextStyle textbutton1 = TextStyle(fontSize: 50.sp);
  static TextStyle textbutton2 = TextStyle(
      color: Colors.blueAccent,
      fontSize: 50.sp,
      fontWeight: FontWeight.w500);
  static TextStyle textbutton3 = TextStyle(
      fontSize: 45.sp,
      color: Colors.black54,
      fontWeight: FontWeight.bold);
  static TextStyle textbutton4 = TextStyle(
    fontSize: 55.sp,
  );
  static TextStyle subtitle1 = GoogleFonts.roboto(fontSize:35.sp, color: Colors.blueAccent);
  static TextStyle subtitle2 = TextStyle(fontSize: 47.sp);
  static TextStyle subtitle3 = TextStyle(fontSize: 40.sp);
  static TextStyle headline1 = GoogleFonts.roboto(
      fontSize: 76.sp, color: Colors.blueAccent, fontWeight: FontWeight.w500);
  static TextStyle headline2 = TextStyle(
      fontSize: 58.sp,
      color: Colors.blue,
      fontWeight: FontWeight.bold);
  static TextStyle headline3 = TextStyle(
      fontSize: 46.sp,
      fontWeight: FontWeight.bold,
      color: Colors.black54);
  static TextStyle hintStyle = TextStyle(color: Colors.black26,fontSize: 40.sp);
  static TextStyle labelstyle = TextStyle(
      color: Colors.black,
      fontSize: 50.sp);
  static TextStyle titleSpkList = GoogleFonts.roboto(
      fontSize: 35.sp, color: Colors.black87, fontWeight: FontWeight.w700);
  static TextStyle supportBy = GoogleFonts.roboto(
      fontSize: 18, color: Color.fromARGB(1000, 0, 111, 186));


  ///Button STYLE
  static ButtonStyle buttonStyle1 = ButtonStyle(
      padding: MaterialStateProperty.all(
          EdgeInsets.all(
              5)),
      backgroundColor: MaterialStateProperty.all(Colors.grey),
      shape: MaterialStateProperty.all<
          RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(50),
          )));
// static TextStyle title =
//     GoogleFonts.roboto(fontSize: 20, color: Colors.black);
// static TextStyle title2 = GoogleFonts.roboto(
//   fontSize: 20,
//   color: Colors.black,
//   fontWeight: FontWeight.bold,
// );
// static TextStyle title3 =
//     GoogleFonts.roboto(fontSize: 17, color: Colors.black);
// static TextStyle titleItemProfile =
//     GoogleFonts.openSans(fontSize: 15, color: Colors.black);
// static TextStyle titleActivity = GoogleFonts.roboto(
//     fontSize: 25, color: Colors.blueAccent, fontWeight: FontWeight.w500);
// static TextStyle subtitleActivity =
//     GoogleFonts.roboto(fontSize: 12, color: Colors.blueAccent);

}
