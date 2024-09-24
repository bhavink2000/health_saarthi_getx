import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../App Helper/font_&_color_helper.dart';
import '../Controller/package_items_details_controller.dart';

packageItemsDetailsAppbar() {
  final controller = Get.find<PackageItemsDetailsController>();
  return AppBar(
    backgroundColor: ColorHelper.hsPrime,
    iconTheme: const IconThemeData(color: Colors.white),
    actions: [
      Obx(() => controller.isLoading.value
          ? Container()
          : Text(
              "${controller.packageDetailsData[0]['service_code']}",
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
