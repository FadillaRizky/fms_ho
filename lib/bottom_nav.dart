import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fms_ho/screen/inventory.dart';
import 'package:fms_ho/screen/maintenance.dart';
import 'package:fms_ho/screen/report.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';


class BottomNav extends StatefulWidget {
  const BottomNav({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> with TickerProviderStateMixin {
  var _bottomNavIndex = 0;

  late AnimationController _fabAnimationController;
  late AnimationController _borderRadiusAnimationController;
  late Animation<double> fabAnimation;
  late Animation<double> borderRadiusAnimation;
  late CurvedAnimation fabCurve;
  late CurvedAnimation borderRadiusCurve;
  late AnimationController _hideBottomBarAnimationController;

  final iconList = <IconData>[
    FontAwesomeIcons.clipboardList,
    FontAwesomeIcons.chartSimple,
  ];
  final Navigation = <Widget>[Maintenance(),Report()];



  @override
  void initState() {
    super.initState();
    _fabAnimationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    _borderRadiusAnimationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    fabCurve = CurvedAnimation(
      parent: _fabAnimationController,
      curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );
    borderRadiusCurve = CurvedAnimation(
      parent: _borderRadiusAnimationController,
      curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );

    fabAnimation = Tween<double>(begin: 0, end: 1).animate(fabCurve);
    borderRadiusAnimation = Tween<double>(begin: 0, end: 1).animate(
      borderRadiusCurve,
    );

    _hideBottomBarAnimationController = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );

    Future.delayed(
      Duration(seconds: 1),
      () => _fabAnimationController.forward(),
    );
    Future.delayed(
      Duration(seconds: 1),
      () => _borderRadiusAnimationController.forward(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: NotificationListener<ScrollNotification>(
          // onNotification: onScrollNotification,
          child: Navigation[_bottomNavIndex]),
      floatingActionButton:
      // isVisible()
      // ? FloatingActionButton(
      //   backgroundColor: Colors.blue,
      //   child: Icon(
      //     FontAwesomeIcons.plus,
      //     color: Colors.white,
      //   ),
      //   onPressed: () async {
      //     // _fabAnimationController.reset();
      //     // _borderRadiusAnimationController.reset();
      //     // _borderRadiusAnimationController.forward();
      //     // _fabAnimationController.forward();
      //     // await Get.to(() => CreateSpk(),
      //     //     duration: Duration(seconds: 1),
      //     //     transition: Transition.size);
      //     // setState(() {});
      //     Navigator.of(context)
      //         .push(PageTransition(
      //       duration: Duration(milliseconds: 900),
      //       type: PageTransitionType.fade,
      //       child: FormSpk(),
      //     ))
      //         .then((value) {
      //       setState(() {});
      //     });
      //   },
      // )
      // :
      SizedBox(
        height: 55,
        width: 55,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: iconList.length,
        tabBuilder: (int index, bool isActive) {
          final color = isActive ? Colors.blue : Colors.black54;
          return Icon(
            iconList[index],
            size: 24,
            color: color,
          );
        },
        backgroundColor: Colors.white,
        activeIndex: _bottomNavIndex,
        splashColor: Colors.blue,
        notchAndCornersAnimation: borderRadiusAnimation,
        splashSpeedInMilliseconds: 300,
        notchSmoothness: NotchSmoothness.smoothEdge,
        gapLocation: GapLocation.center,
        leftCornerRadius: 20,
        rightCornerRadius: 20,
        onTap: (index) => setState(() => _bottomNavIndex = index),
        hideAnimationController: _hideBottomBarAnimationController,
        shadow: BoxShadow(
          offset: Offset(0, 1),
          blurRadius: 12,
          spreadRadius: 0.5,
          color: Colors.black26,
        ),
      ),
    );
  }
}
