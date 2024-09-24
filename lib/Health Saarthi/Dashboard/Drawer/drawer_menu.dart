import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Device%20Information/device_information.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/font_&_color_helper.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/Dashboard/Bottom%20Menu%20Screens/Profile%20Menu/profile_menu.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/Dashboard/Drawer/FAQ/f_a_q_screen.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/Dashboard/Drawer/My%20Booking%20History/my_booking_history.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/Dashboard/Drawer/QR%20Code/q_r_code_screen.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/Dashboard/Drawer/Refer%20A%20Chemist/refer_a_chemist_screen.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/Dashboard/Drawer/Support%20Screen/support_screen.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/Dashboard/dashboard.dart';

import '../../App Helper/Widget Helper/bottom_nav_bar.dart';
import '../Bottom Menu Screens/Record Menu/record_menu.dart';
import 'Book Test Screen/book_test_screen.dart';
import 'Contact Us Screen/contact_us_screen.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomBarController = Get.put(BottomBarController());
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: Container(
        color: Colors.white,
        width: Get.width / 1.5,
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Image(
                  image: AssetImage("assets/health_saarthi_logo.png"),
                  width: 175),
              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Material(
                        color: Colors.white,
                        child: InkWell(
                          onTap: () {
                            bottomBarController.index.value = 0;
                            Get.offAll(() => const Dashboard());
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(15, 5, 10, 10),
                            child: Row(
                              children: [
                                Icon(Icons.dashboard,
                                    color: ColorHelper.hsPrimeOne, size: 25),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text("Home",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily:
                                            FontHelper.montserratMedium))
                              ],
                            ),
                          ),
                        ),
                      ),
                      Divider(
                          color: ColorHelper.hsPrimeOne,
                          thickness: 0.5,
                          endIndent: 0,
                          indent: 20),
                      DrawerMenuItemsWidget(
                        itemName: 'Book a test',
                        iconData: Icons.book,
                        itemOnTap: () {
                          Get.to(() => const BookTestScreen());
                        },
                      ),
                      DrawerMenuItemsWidget(
                        itemName: 'My booking history',
                        iconData: Icons.shopping_bag_rounded,
                        itemOnTap: () {
                          Get.to(() => const MyBookingHistory());
                        },
                      ),
                      DrawerMenuItemsWidget(
                        itemName: 'My report',
                        iconData: Icons.event_available_rounded,
                        itemOnTap: () {
                          Get.to(() => const ReportMenu(isFromDrawer: true));
                        },
                      ),
                      DrawerMenuItemsWidget(
                        itemName: 'My profile',
                        iconData: Icons.person_pin,
                        itemOnTap: () {
                          Get.to(() => const ProfileMenu(isFromDrawer: true));
                        },
                      ),
                      DrawerMenuItemsWidget(
                        itemName: 'Contact us',
                        iconData: Icons.phone_android_rounded,
                        itemOnTap: () {
                          Get.to(() => const ContactUsScreen());
                        },
                      ),
                      DrawerMenuItemsWidget(
                        itemName: 'FAQ',
                        iconData: Icons.question_answer_rounded,
                        itemOnTap: () {
                          Get.to(() => const FAQScreen());
                        },
                      ),
                      DrawerMenuItemsWidget(
                        itemName: 'Support',
                        iconData: Icons.support_agent_rounded,
                        itemOnTap: () {
                          Get.to(() => const SupportScreen());
                        },
                      ),
                      DrawerMenuItemsWidget(
                        itemName: 'Refer a chemist',
                        iconData: Icons.science_rounded,
                        itemOnTap: () {
                          Get.to(() => const ReferAChemistScreen());
                        },
                      ),
                      DrawerMenuItemsWidget(
                        itemName: 'Download QR code',
                        iconData: Icons.qr_code,
                        itemOnTap: () {
                          Get.to(() => const QRCodeScreen());
                        },
                      ),
                      Material(
                        color: Colors.white,
                        child: InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return BackdropFilter(
                                    filter:
                                        ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                                    child: AlertDialog(
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0))),
                                      content: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Image.asset(
                                                "assets/health_saarthi_logo_transparent_bg.png",
                                                width: 150),
                                            const Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  5, 10, 5, 10),
                                              child: Text(
                                                "Are You Sure Would Like To Logout?",
                                                style: TextStyle(
                                                    fontFamily: FontHelper
                                                        .montserratRegular,
                                                    fontSize: 16),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: <Widget>[
                                                InkWell(
                                                  onTap: () => Get.back(),
                                                  child: Container(
                                                    width: Get.width / 4,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color:
                                                          ColorHelper.hsPrime,
                                                    ),
                                                    child: const Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              10, 8, 10, 8),
                                                      child: Text(
                                                        "Stay",
                                                        style: TextStyle(
                                                            fontFamily: FontHelper
                                                                .montserratMedium,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    DeviceInformation
                                                        .logoutUser();
                                                  },
                                                  child: Container(
                                                    width: Get.width / 4,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color:
                                                          ColorHelper.hsPrime,
                                                    ),
                                                    child: const Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              10, 8, 10, 8),
                                                      child: Text(
                                                        "Logout",
                                                        style: TextStyle(
                                                            fontFamily: FontHelper
                                                                .montserratMedium,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                });
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(15, 10, 10, 10),
                            child: Row(
                              children: [
                                Icon(Icons.logout_rounded,
                                    color: ColorHelper.hsPrimeOne, size: 25),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text("Log out",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily:
                                            FontHelper.montserratMedium))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerMenuItemsWidget extends StatelessWidget {
  final String? itemName;
  final VoidCallback? itemOnTap;
  final IconData? iconData;
  const DrawerMenuItemsWidget(
      {super.key, this.itemOnTap, this.itemName, this.iconData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: Colors.white,
          child: InkWell(
            onTap: itemOnTap,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 10, 10),
              child: Row(
                children: [
                  Icon(iconData, color: ColorHelper.hsPrimeOne, size: 25),
                  const SizedBox(
                    width: 10,
                  ),
                  Text("$itemName",
                      style: const TextStyle(
                          fontSize: 14,
                          fontFamily: FontHelper.montserratMedium))
                ],
              ),
            ),
          ),
        ),
        Divider(
            color: ColorHelper.hsPrimeOne,
            thickness: 0.5,
            endIndent: 0,
            indent: 20),
      ],
    );
  }
}
