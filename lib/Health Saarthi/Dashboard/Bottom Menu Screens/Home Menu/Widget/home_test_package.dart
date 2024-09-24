import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/font_&_color_helper.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/Dashboard/Bottom%20Menu%20Screens/Home%20Menu/Attach%20Prescripton/attach_priscription.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/Dashboard/Bottom%20Menu%20Screens/Home%20Menu/Instant%20Booking/instant_booking.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/Dashboard/Bottom%20Menu%20Screens/Home%20Menu/Package%20List/package_list.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/Dashboard/Bottom%20Menu%20Screens/Home%20Menu/Test%20List/test_list_items.dart';

import '../Instant Booking/Controller/instant_booking_controller.dart';

class HomeTestPackage extends StatelessWidget {
  const HomeTestPackage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CommonTestPackageUI(
              onTap: () {
                Get.to(() => const TestListItems());
              },
              imagePath: 'assets/Home/test.png',
              label: 'Lab Test',
              subTitleImage: 'assets/Home/test_sub.png',
              subTitle: 'View Test',
            ),
            // SizedBox(width: 10,),
            CommonTestPackageUI(
              onTap: () {
                Get.to(() => const PackageListItems());
              },
              imagePath: 'assets/Home/package.png',
              label: 'Package',
              subTitleImage: 'assets/Home/package_sub.png',
              subTitle: 'View Package',
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CommonTestPackageUI(
              onTap: () {
                Get.to(() => const AttachPrescription());
              },
              imagePath: 'assets/Home/prescription.png',
              label: 'Prescription',
              subTitleImage: 'assets/Home/prescription_sub.png',
              subTitle: 'Attach File',
            ),
            // SizedBox(width: 10,),
            CommonTestPackageUI(
              onTap: () {
                Get.delete<InstantBookingController>();
                Get.to(() => const InstantBooking());
              },
              imagePath: 'assets/Home/booking.png',
              label: 'Instant Book',
              subTitleImage: 'assets/Home/booking_sub.png',
              subTitle: 'Book Now!',
            ),
          ],
        ),
      ],
    );
  }
}

class CommonTestPackageUI extends StatelessWidget {
  final VoidCallback onTap;
  final String imagePath, label, subTitleImage, subTitle;
  const CommonTestPackageUI(
      {super.key,
      required this.onTap,
      required this.imagePath,
      required this.label,
      required this.subTitleImage,
      required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 3,
        margin: EdgeInsets.zero,
        shadowColor: ColorHelper.hsPrime.withOpacity(0.3),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Container(
          width: Get.width / 2.15,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(width: 10),
                      Image(image: AssetImage(imagePath), width: 30),
                      const SizedBox(width: 10),
                      Text(label,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontFamily: FontHelper.montserratMedium,
                          )),
                      const SizedBox(width: 1),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
                        child: Icon(Icons.arrow_forward_ios_rounded, size: 10),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: ColorHelper.hsPrime.withOpacity(0.1)),
                  child: Row(
                    children: [
                      Image(image: AssetImage(subTitleImage), width: 12),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        subTitle,
                        style: const TextStyle(
                            fontFamily: FontHelper.montserratRegular,
                            fontSize: 10),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
