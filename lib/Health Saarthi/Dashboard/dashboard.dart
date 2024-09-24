import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/Dashboard/Dashboard%20Widgets/dashboard_appbar.dart';

import '../App Helper/Check Internet Helper/Bindings/dependency_injection.dart';
import '../App Helper/Widget Helper/bottom_nav_bar.dart';
import '../App Helper/font_&_color_helper.dart';
import 'Dashboard Controller/dashboard_controller.dart';
import 'Drawer/drawer_menu.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    NetworkDependencyInjection.init();
    final bottomBarController = Get.put(BottomBarController());
    final controller = Get.put(DashboardController());
    return PopScope(
      canPop: false,
      onPopInvoked: (val) {
        exitBox();
      },
      child: Scaffold(
        key: controller.scaffoldKey,
        drawerScrimColor: ColorHelper.hsPrime.withOpacity(0.3),
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        bottomSheet: bottomNavBar(),
        appBar: dashboardAppbar(),
        body: Obx(
            () => bottomBarController.screens[bottomBarController.index.value]),
        drawer: const DrawerMenu(),
      ),
    );
  }

  exitBox() {
    return Get.dialog(
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            contentPadding: const EdgeInsets.only(top: 10.0),
            content: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image.asset(
                    "assets/health_saarthi_logo_transparent_bg.png",
                    width: 150,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(
                      "Are you sure you want to exit.?",
                      style: TextStyle(
                          fontFamily: FontHelper.montserratMedium,
                          fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      TextButton(
                        onPressed: () => Get.back(),
                        style: ButtonStyle(
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)))),
                        child: const Text(
                          "Stay",
                          style: TextStyle(
                              fontFamily: FontHelper.montserratMedium,
                              letterSpacing: 2),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          exit(0);
                        },
                        style: ButtonStyle(
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)))),
                        child: const Text(
                          "Exit",
                          style: TextStyle(
                              fontFamily: FontHelper.montserratMedium,
                              letterSpacing: 2),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        barrierDismissible: false);
  }
}
