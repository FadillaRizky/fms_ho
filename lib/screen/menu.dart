import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fms_ho/bottom_nav.dart';
import 'package:fms_ho/screen/inventory.dart';
import 'package:fms_ho/screen/maintenance.dart';

import '../utils/alerts.dart';
import 'dashboard.dart';
import 'grid_menu.dart';

class Menu extends StatelessWidget {
  // const Menu({Key? key}) : super(key: key);

  void tapped(int index,BuildContext context) {
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Dashboard()));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Inventory()));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => BottomNav()));
        break;
      default:
        Alerts.showMessage('Coming Soon', context);
    }
  }

  // final listMenu =<String>['Dashboard','Inventory','Delivery Status','Driver','Confirm DO','Geofance','Maintenance','Kendaraan','POD','Payment','Pending PO','License'];
  final List<MenuIcon> menu = [
    MenuIcon(name: 'Dashboard', imagePath: 'assets/icon_dashboard.png'),
    MenuIcon(name: 'Inventory', imagePath: 'assets/icon_inventory.png'),
    MenuIcon(name: 'Driver', imagePath: 'assets/icon_driver.png'),
    MenuIcon(name: 'Maintenance', imagePath: 'assets/icon_maintenance.png'),
    MenuIcon(name: 'Kendaraan', imagePath: 'assets/icon_kendaraan.png'),
    MenuIcon(name: 'License', imagePath: 'assets/icon_license.png'),
    MenuIcon(
        name: 'Delivery Status', imagePath: 'assets/icon_delivery_status.png'),
    MenuIcon(name: 'Confirm DO', imagePath: 'assets/icon_confirm_do.png'),
    MenuIcon(name: 'Geofance', imagePath: 'assets/icon_geofance.png'),
    MenuIcon(name: 'POD', imagePath: 'assets/icon_pod.png'),
    MenuIcon(name: 'Payment', imagePath: 'assets/icon_payment.png'),
    MenuIcon(name: 'Pending PO', imagePath: 'assets/icon_pending_po.png'),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/background.jpeg"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(40, 0, 40, 0).r,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 127.h,
                  ),
                  Hero(
                    tag: 'logo_jpp',
                    child: Image.asset(
                      'assets/logo_jpp.png',
                      width: 440.w,
                      height: 262.h,
                    ),
                  ),
                  SizedBox(
                    height: 56.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Hero(
                        tag: 'support_by',
                        child: Text(
                          "Support by :    ",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  fontSize: 50.sp,
                                  color: Color.fromARGB(1000, 0, 111, 186)),
                        ),
                      ),
                      Hero(
                        tag: 'logo',
                        child: Image.asset(
                          'assets/logo_utilizes2.png',
                          width: 280.w,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 157.h,
                  ),
                  Expanded(
                    child: GridView.builder(
                      itemCount: 12,
                      itemBuilder: (context, index) {
                        final item = menu[index];
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                tapped(index,context);
                              },
                              child: Container(
                                height: 175.w,
                                width: 175.w,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Image.asset(
                                  item.imagePath,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              item.name,
                              style: TextStyle(
                                  fontSize: 38.sp, fontWeight: FontWeight.w500),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        );
                      },

                      // GestureDetector(
                      //     onTap: () => tapped(index),
                      //     child: Container(decoration: BoxDecoration(
                      //         color: Colors.white70, shape: BoxShape.circle))),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        // mainAxisSpacing: 10,
                        // crossAxisSpacing: 10,
                        // childAspectRatio: 3 / 2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
