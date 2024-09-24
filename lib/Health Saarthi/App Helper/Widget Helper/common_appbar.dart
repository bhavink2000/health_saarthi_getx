import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/font_&_color_helper.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/Dashboard/Add%20To%20Cart/Test%20Cart/test_cart.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/Dashboard/Notification%20Menu/notification_menu.dart';

commonAppbar(String label) {
  return AppBar(
    backgroundColor: Colors.white,
    title: Text(label,
        style: const TextStyle(
            fontFamily: FontHelper.montserratMedium,
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.bold)),
    actions: [
      IconButton(
          onPressed: () {
            Get.off(() => const TestCart());
          },
          icon: Icon(Icons.shopping_cart_rounded,
              color: ColorHelper.hsPrime, size: 24)),
      IconButton(
          onPressed: () {
            Get.to(() => const NotificationMenu());
          },
          icon: Icon(Icons.circle_notifications_rounded,
              color: ColorHelper.hsPrime, size: 24)),
    ],
  );
}
