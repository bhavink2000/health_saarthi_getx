import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/font_&_color_helper.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/icon_helper.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/Dashboard/Bottom%20Menu%20Screens/Home%20Menu/Instant%20Booking/instant_booking.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/Dashboard/Bottom%20Menu%20Screens/Home%20Menu/home_menu.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/Dashboard/Bottom%20Menu%20Screens/Profile%20Menu/profile_menu.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/Dashboard/Bottom%20Menu%20Screens/Record%20Menu/record_menu.dart';

bottomNavBar() {
  final controller = Get.put(BottomBarController());
  double containerWidth = Get.width / 5;
  double fontSize = 12;
  return Container(
    height: 65,
    margin: const EdgeInsets.fromLTRB(5, 0, 5, 5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: ColorHelper.hsPrimeOne,
    ),
    padding: const EdgeInsets.symmetric(vertical: 5.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Obx(
          () => GestureDetector(
              onTap: () {
                controller.index.value = 0;
                log('index ==> ${controller.index.value}');
              },
              child: Container(
                width: containerWidth,
                decoration: controller.index.value == 0
                    ? BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10))
                    : const BoxDecoration(),
                padding: const EdgeInsets.only(
                  top: 5,
                ),
                child: Column(
                  children: [
                    ImageIcon(IconHelper.HHome,
                        size: 25,
                        color: controller.index.value == 0
                            ? Colors.black
                            : Colors.white),
                    Text(
                      'Home',
                      style: TextStyle(
                          fontSize: fontSize,
                          color: controller.index.value == 0
                              ? ColorHelper.hsPrime
                              : Colors.white),
                    )
                  ],
                ),
              )),
        ),
        Obx(
          () => GestureDetector(
              onTap: () {
                controller.index.value = 1;
                log('index ==> ${controller.index.value}');
              },
              child: Container(
                width: containerWidth,
                decoration: controller.index.value == 1
                    ? BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10))
                    : const BoxDecoration(),
                padding: const EdgeInsets.only(top: 5),
                child: Column(
                  children: [
                    ImageIcon(IconHelper.HBookNow,
                        size: 25,
                        color: controller.index.value == 1
                            ? Colors.black
                            : Colors.white),
                    Text(
                      'Book Now',
                      style: TextStyle(
                          fontSize: fontSize,
                          color: controller.index.value == 1
                              ? ColorHelper.hsPrime
                              : Colors.white),
                    )
                  ],
                ),
              )),
        ),
        Obx(
          () => GestureDetector(
            onTap: () {
              controller.index.value = 2;
              log('index ==> ${controller.index.value}');
            },
            child: Container(
              width: containerWidth,
              decoration: controller.index.value == 2
                  ? BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10))
                  : const BoxDecoration(),
              padding: const EdgeInsets.only(top: 5),
              child: Column(
                children: [
                  ImageIcon(IconHelper.HRecord,
                      size: 25,
                      color: controller.index.value == 2
                          ? Colors.black
                          : Colors.white),
                  Text(
                    'Record',
                    style: TextStyle(
                        fontSize: fontSize,
                        color: controller.index.value == 2
                            ? ColorHelper.hsPrime
                            : Colors.white),
                  )
                ],
              ),
            ),
          ),
        ),
        Obx(
          () => GestureDetector(
            onTap: () {
              controller.index.value = 3;
              log('index ==> ${controller.index.value}');
            },
            child: Container(
              width: containerWidth,
              decoration: controller.index.value == 3
                  ? BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10))
                  : const BoxDecoration(),
              padding: const EdgeInsets.only(top: 5),
              child: Column(
                children: [
                  ImageIcon(IconHelper.HProfile,
                      size: 25,
                      color: controller.index.value == 3
                          ? Colors.black
                          : Colors.white),
                  Text(
                    'Profile',
                    style: TextStyle(
                        fontSize: fontSize,
                        color: controller.index.value == 3
                            ? ColorHelper.hsPrime
                            : Colors.white),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

class BottomBarController extends GetxController {
  RxInt index = 0.obs;

  List screens = [
    const HomeMenu(),
    const InstantBooking(isFromHome: true),
    const ReportMenu(),
    const ProfileMenu(),
  ];
}
