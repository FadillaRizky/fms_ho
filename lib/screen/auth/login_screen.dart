import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:page_transition/page_transition.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../api/LoginResponse.dart';
import '../../api/api.dart';
import '../../constants.dart';
import '../../utils/alerts.dart';
import '../../utils/shared_pref.dart';

import 'package:http/http.dart' as http;

import '../menu.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController controllerMobileNumber = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  bool isChecked = false;
  bool invisible = true;
  late Box box1;

  bool load = false;

  login() async {
    var driver_phone = controllerMobileNumber.text;
    var password = controllerPassword.text;
    //validasi
    if (driver_phone.isEmpty) {
      Alerts.showMessage("Masukan Nomor Hp Anda", context);
      return;
    }
    if (password.isEmpty) {
      Alerts.showMessage("Masukan Password Anda", context);
      return;
    }
    var data = {
      "driver_phone": driver_phone,
      "password": password,
    };
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(
                color: Colors.white,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Login ..",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ],
          ),
        );
      },
    );
    // Api.submitLogin(data).then((value) async {
    //   print(value);
    //   if (isChecked) {
    //     box1.put('driver_phone', controllerMobileNumber.text);
    //   }
    //   if (value == false) {
    //     print('c');
    //     Alerts.showMessage("Sinyal Buruk", context);
    //     Navigator.pop(context);
    //   }
    //   if (value.message != "login success") {
    //     print("b");
    //     Alerts.showMessage("Login Gagal..", context);
    //     Navigator.pop(context);
    //   }
    //   if (value.message == "login success") {
    //     LoginPref.saveToSharedPref(value.data!.token!);
    //     print(value.data.token);
    //     Alerts.showMessage("Login Berhasil..", context);
    //     Navigator.pop(context);
    //     Navigator.of(context).pushReplacement(PageTransition(
    //         duration: Duration(seconds: 1),
    //         type: PageTransitionType.fade,
    //         child: ActivityScreen()));
    //   }
    //
    //
    //
    // });

    try {
      var url = "http://fms-api.ganekodev.com/api/driver/login";
      var response = await http
          .post(Uri.parse(url), body: data)
          .timeout(Duration(seconds: 3));
      var result = LoginResponse.fromJson(jsonDecode(response.body));
      if (isChecked) {
        box1.put('driver_phone', controllerMobileNumber.text);
      }
      if (result.message == "login success") {
        LoginPref.saveToSharedPref(result.data!.token!);
        Alerts.showMessage("Login Berhasil..", context);
        Navigator.pop(context);
        Navigator.of(context).pushReplacement(PageTransition(
            duration: Duration(seconds: 1),
            type: PageTransitionType.fade,
            child:
            Menu()
        ));
      } else if (result.message != "login success") {
        Alerts.showMessage("Login Gagal..", context);
        Navigator.pop(context);
      }
    } on TimeoutException catch (_) {
      Alerts.showMessage("Sinyal Buruk", context);
      Navigator.pop(context);
    } catch (e) {
      print(e);
    }

    // Api.submitLogin(data).then((value) async {
    //   //ketika pesan nya bukan successful
    //   if (value.message != "login success") {
    //     //muncul error
    //     Alerts.showMessage("Login Gagal !!!", context);
    //     return;
    //   }
    //
    //   LoginPref.saveToSharedPref(value.data!.token!);
    //   if (isChecked) {
    //     box1.put('driver_phone', controllerMobileNumber.text);
    //   }
    //   if (await LoginPref.checkPref() == true) {
    //     // Alerts.showMessage("Login Success !!!", context);
    //     Navigator.of(context).pushReplacement(PageTransition(
    //         duration: Duration(milliseconds: 800),
    //         type: PageTransitionType.fade,
    //         child: ActivityScreen()));
    //   }
    // });
  }

  void onLoading() {
    LoginPref.removePref();
    var driver_phone = controllerMobileNumber.text;
    var password = controllerPassword.text;
    //validasi
    if (driver_phone.isEmpty) {
      Alerts.showMessage("Please Enter your Mobile Phone", context);
      return;
    }
    if (password.isEmpty) {
      Alerts.showMessage("Please enter your Password", context);
      return;
    }
    var data = {
      "driver_phone": driver_phone,
      "password": password,
    };

    Api.submitLogin(data).then((value) async {
      if (value.message != "login success") {
        setState(() {
          load = false;
        });
        return;
      }

      LoginPref.saveToSharedPref(value.data!.token!);
      if (isChecked) {
        box1.put('driver_phone', controllerMobileNumber.text);
      }
      if (await LoginPref.checkPref() == true) {
        setState(() {
          load = true;
        });
      }
    });
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(
                color: Colors.white,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Loading ..",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ],
          ),
        );
      },
    );
    new Future.delayed(new Duration(seconds: 2), () {
      Navigator.pop(context);
      if (load == true) {
        // Navigator.of(context).pushReplacement(PageTransition(
        //     duration: Duration(milliseconds: 1000),
        //     type: PageTransitionType.fade,
        //     child: ActivityScreen()));
      } else {
        Alerts.showMessage("Login Gagal ..", context);
      }
    });
  }

  launchWhatsApp() async {
    var whatsapp = "+6282122075284";
    var whatsappURl_android = "whatsapp://send?phone=" + whatsapp + "&text=";
    var whatappURL_ios = "https://wa.me/$whatsapp?text=${Uri.parse("")}";
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunchUrl(Uri.parse(whatappURL_ios))) {
        await launchUrl(Uri.parse(whatappURL_ios));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: new Text("whatsapp no installed")));
      }
    } else {
      if (await canLaunchUrl(Uri.parse(whatsappURl_android))) {
        await launchUrl(Uri.parse(whatsappURl_android));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: new Text("whatsapp no installed")));
      }
    }
  }

  @override
  void initState() {
    super.initState();
    createBox();
  }

  void createBox() async {
    box1 = await Hive.openBox("logindata");
    getData();
  }

  void getData() async {
    if (box1.get('driver_phone') != null) {
      controllerMobileNumber.text = box1.get('driver_phone');
      isChecked = true;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    var font_size = width / MediaQuery.of(context).devicePixelRatio;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Stack(children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/background.jpeg"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 0, 50, 0).r,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 250.h,
                    ),
                    Hero(
                      tag: "logo_jpp",
                      child: Image.asset(
                        'assets/logo_jpp.png',
                        width: 571.w,
                        height: 300.h,
                      ),
                    ),
                    SizedBox(
                      height: 201.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Hero(
                          tag: "support_by",
                          child: Text(
                            "Support by :    ",
                            style: Theme.of(context).textTheme.headline6!.copyWith(
                                fontSize: 58.sp,
                                color: Color.fromARGB(1000, 0, 111, 186)),
                          ),
                        ),
                        Hero(
                          tag: "logo",
                          child: Image.asset(
                            'assets/logo_utilizes2.png',
                            width: 367.w,
                            height: 97.h,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 93.h,
                    ),
                    Container(
                      width: double.infinity,
                      height: 113.h,
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        controller: controllerMobileNumber,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(20, 3, 1, 3),
                          hintText: "Nomor Telepon",
                          hintStyle: TextStyle(color: Colors.black26),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 0, style: BorderStyle.none),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 36.h,
                    ),
                    Container(
                      width: double.infinity,
                      height: 113.h,
                      child: TextFormField(
                        obscureText: invisible,
                        keyboardType: TextInputType.text,
                        controller: controllerPassword,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(20, 3, 1, 3),
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.black26),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 0, style: BorderStyle.none),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          suffixIcon: IconButton(
                              icon: Icon((invisible == true)
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  invisible = !invisible;
                                });
                              }),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Checkbox(
                            value: isChecked,
                            onChanged: (value) {
                              setState(() {
                                isChecked = !isChecked;
                              });
                            }),
                        Text(
                          "Ingatkan Saya",
                          style: TextStyle(
                              fontSize: 41.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      height: height / 18,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color.fromARGB(225, 0, 111, 186),
                          Color.fromARGB(225, 58, 171, 249)
                        ]),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                        ),
                        onPressed: () {
                          login();
// onLoading();

// Navigator.of(context).push(PageTransition(
//   type: PageTransitionType.fade,
//   child: ActivityScreen(),
// ));
// login(context);
                        },
                        child: Text(
                          "Masuk",
                          style: Constants.textbutton1,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    TextButton(
                        onPressed: () {
                          launchWhatsApp();
                        },
                        child: Text(
                          "Butuh Bantuan? Hubungi kami",
                          style: TextStyle(color: Colors.white, fontSize: 41.sp),
                        ))
                  ],
                ),
              ),
            )
          ]),
        ));
  }
}
