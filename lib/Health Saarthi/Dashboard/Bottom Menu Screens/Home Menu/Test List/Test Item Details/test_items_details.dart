import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Netwok%20Helper/Cart%20Data%20Helper/cart_data_helper.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/loading_helper.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/Dashboard/Bottom%20Menu%20Screens/Home%20Menu/Test%20List/Test%20Item%20Details/Widget/test_items_details_appbar.dart';
import '../../../../../App Helper/font_&_color_helper.dart';
import 'Controller/test_items_details_controller.dart';

class TestItemDetails extends StatelessWidget {
  final int testId;
  const TestItemDetails({super.key, required this.testId});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TestItemsDetailsController(testId: testId));
    return Scaffold(
        appBar: testItemsDetailsAppbar(),
        body: Obx(
          () => controller.isLoading.value
              ? const CenterLoading()
              : Column(
                  children: [
                    SingleChildScrollView(
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
                                    "${controller.testDetailsData[0]['service_name']}",
                                    style: const TextStyle(
                                        fontFamily: FontHelper.montserratMedium,
                                        letterSpacing: 0.5,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(height: 10),
                                Text(
                                  "${controller.testDetailsData[0]['specimen_volume'] ?? 'N/A'}",
                                  style: const TextStyle(
                                      fontFamily: FontHelper.montserratRegular,
                                      letterSpacing: 0.5,
                                      color: Colors.black87,
                                      fontSize: 12),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "${controller.testDetailsData[0]['testList'] ?? 'N/A'}",
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
                                    "\u{20B9}${controller.testDetailsData[0]['mrp']}",
                                    style: TextStyle(
                                        fontFamily: FontHelper.montserratMedium,
                                        fontSize: 18,
                                        color: ColorHelper.hsPrime)),
                                const Spacer(),
                                InkWell(
                                  onTap: () {
                                    CartDataHelper.addToCartTest(testId)
                                        .then((value) {
                                      controller.testDetailsData.clear();
                                      controller.fetchTestDetails();
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: ColorHelper.hsPrime),
                                    padding:
                                        const EdgeInsets.fromLTRB(15, 8, 15, 8),
                                    child: Text(
                                      controller.testDetailsData[0]
                                                  ['booked_status'] ==
                                              1
                                          ? "Booked"
                                          : "+ Book Now",
                                      style: const TextStyle(
                                          fontFamily:
                                              FontHelper.montserratRegular,
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
                                width: Get.width / 1.5,
                                child: Text(
                                    "${controller.testDetailsData[0]['collect'] ?? 'N/A'}",
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
                                    "${controller.testDetailsData[0]['ordering_info'] ?? 'N/A'}",
                                    style: const TextStyle(
                                        fontFamily:
                                            FontHelper.montserratRegular,
                                        letterSpacing: 0.5,
                                        fontSize: 14)),
                                const SizedBox(height: 10),
                                Text(
                                  "${controller.testDetailsData[0]['reported'] ?? 'N/A'}",
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
                    )
                  ],
                ),
        ));
  }
}
