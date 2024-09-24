import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/Dashboard/Bottom%20Menu%20Screens/Home%20Menu/Test%20List/Test%20Item%20Details/Controller/test_items_details_controller.dart';
import '../../../../../../App Helper/font_&_color_helper.dart';

testItemsDetailsAppbar() {
  final controller = Get.find<TestItemsDetailsController>();
  return AppBar(
    backgroundColor: ColorHelper.hsPrime,
    iconTheme: const IconThemeData(color: Colors.white),
    actions: [
      Obx(() => controller.isLoading.value
          ? Container()
          : Text(
        "${controller.testDetailsData[0]['service_code']}",
        style: const TextStyle(
            fontFamily: FontHelper.montserratMedium,
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold),
        textAlign: TextAlign.right,
      )),
      const SizedBox(
        width: 10,
      )
    ],
  );
}
