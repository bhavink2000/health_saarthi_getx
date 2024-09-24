import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Netwok%20Helper/Cart%20Data%20Helper/cart_data_helper.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/font_&_color_helper.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/loading_helper.dart';
import 'Controller/package_items_details_controller.dart';
import 'Widget/package_items_details_appbar.dart';

class PackageItemsDetails extends StatelessWidget {
  final int packageId;
  const PackageItemsDetails({super.key, required this.packageId});

  @override
  Widget build(BuildContext context) {
    final controller =
        Get.put(PackageItemsDetailsController(packageId: packageId));
    return Scaffold(
      appBar: packageItemsDetailsAppbar(),
      body: Obx(() => controller.isLoading.value
          ? const CenterLoading()
          : SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 10, 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "${controller.packageDetailsData[0]['service_name']}",
                            style: const TextStyle(
                                fontFamily: FontHelper.montserratMedium,
                                letterSpacing: 0.5,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),
                        Text(
                          "${controller.packageDetailsData[0]['specimen_volume'] ?? 'N/A'}",
                          style: const TextStyle(
                              fontFamily: FontHelper.montserratRegular,
                              letterSpacing: 0.5,
                              color: Colors.black87,
                              fontSize: 12),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "${controller.packageDetailsData[0]['testList'] ?? 'N/A'}",
                          style: const TextStyle(
                              fontFamily: FontHelper.montserratMedium,
                              letterSpacing: 0.5,
                              color: Colors.black,
                              fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 10, 10),
                    child: Row(
                      children: [
                        Text(
                            "\u{20B9}${controller.packageDetailsData[0]['mrp']}",
                            style: TextStyle(
                                fontFamily: FontHelper.montserratMedium,
                                fontSize: 18,
                                color: ColorHelper.hsPrime)),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            CartDataHelper.addToCartTest(packageId)
                                .then((value) {
                              controller.packageDetailsData.clear();
                              controller.fetchPackageDetails();
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: ColorHelper.hsPrime),
                            padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
                            child: Text(
                              controller.packageDetailsData[0]
                                          ['booked_status'] ==
                                      1
                                  ? "Booked"
                                  : "+ Book Now",
                              style: const TextStyle(
                                  fontFamily: FontHelper.montserratRegular,
                                  fontSize: 13,
                                  color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width / 1.5,
                        child: Text(
                            "${controller.packageDetailsData[0]['collect'] ?? 'N/A'}",
                            style: const TextStyle(
                              fontFamily: FontHelper.montserratRegular,
                              letterSpacing: 0.5,
                              fontSize: 14,
                            ))),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 10, 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "${controller.packageDetailsData[0]['ordering_info'] ?? 'N/A'}",
                            style: const TextStyle(
                                fontFamily: FontHelper.montserratRegular,
                                letterSpacing: 0.5,
                                fontSize: 14)),
                        const SizedBox(height: 10),
                        Text(
                          "${controller.packageDetailsData[0]['reported'] ?? 'N/A'}",
                          style: const TextStyle(
                              fontFamily: FontHelper.montserratRegular,
                              letterSpacing: 0.5,
                              color: Colors.black87,
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
    );
  }
}
