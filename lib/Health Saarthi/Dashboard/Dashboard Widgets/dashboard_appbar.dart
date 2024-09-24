import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/Dashboard/Add%20To%20Cart/Test%20Cart/test_cart.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/Dashboard/Dashboard%20Controller/dashboard_controller.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/Dashboard/Notification%20Menu/notification_menu.dart';

import '../../App Helper/font_&_color_helper.dart';

dashboardAppbar() {
  final controller = Get.find<DashboardController>();
  return AppBar(
    backgroundColor: Colors.white,
    automaticallyImplyLeading: false,
    scrolledUnderElevation: 0,
    centerTitle: true,
    title:
        const Image(image: AssetImage("assets/health_saarthi_logo.png"), width: 150),
    leading: IconButton(
        icon: Icon(
          Icons.menu_rounded,
          color: ColorHelper.hsPrime,
        ),
        onPressed: () {
          controller.scaffoldKey.currentState?.openDrawer();
        }),
    actions: [
      IconButton(
          onPressed: () {
            Get.to(() => const TestCart());
          },
          icon: Icon(Icons.shopping_cart_rounded,
              color: ColorHelper.hsPrime, size: 25)),
      IconButton(
          onPressed: () {
            Get.to(() => const NotificationMenu());
          },
          icon: Icon(Icons.circle_notifications_rounded,
              color: ColorHelper.hsPrime, size: 25)),
      const SizedBox(width: 5),
    ],
  );
}
