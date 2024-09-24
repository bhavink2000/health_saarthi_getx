import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Netwok%20Helper/Cart%20Data%20Helper/cart_data_helper.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Widget%20Helper/common_appbar.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/font_&_color_helper.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/loading_helper.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/snakebar_helper.dart';

import '../../../../App Helper/Frontend Helper/custom_pagination.dart';
import 'Controller/today_deal_controller.dart';

class TodayDeal extends StatelessWidget {
  final int? dealId;
  const TodayDeal({super.key, this.dealId});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TodayDealController(dealId: dealId));
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: commonAppbar('Today\'s Deal'),
      body: Obx(() => controller.dealLoading.value
          ? const CenterLoading()
          : controller.todayDealModel.value.todayDetailsData!.data!.isEmpty
              ? const Center(
                  child: Text(
                  "Deal is not available",
                  style: TextStyle(
                      fontFamily: FontHelper.montserratRegular,
                      fontWeight: FontWeight.bold),
                ))
              : AnimationLimiter(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    // itemCount: value.todayDealDetailsList.data!.todayDetailsData!.data!.length,
                    itemCount: controller
                        .todayDealModel.value.todayDetailsData!.data!.length,
                    itemBuilder: (context, index) {
                      // var todayDealI = value.todayDealDetailsList.data!.todayDetailsData!.data![index];
                      var todayDealI = controller
                          .todayDealModel.value.todayDetailsData!.data![index];
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 1000),
                        child: Column(
                          children: [
                            FadeInAnimation(
                              child: Container(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                child: Card(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  shadowColor: Colors.grey.withOpacity(0.8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 10, 10, 5),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(todayDealI.serviceName!,
                                                style: const TextStyle(
                                                    fontFamily: FontHelper
                                                        .montserratMedium,
                                                    fontSize: 15)),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              todayDealI.specimenVolume!,
                                              style: const TextStyle(
                                                  fontFamily: FontHelper
                                                      .montserratRegular,
                                                  letterSpacing: 0.5,
                                                  color: Colors.black87,
                                                  fontSize: 12),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 5, 10, 10),
                                        child: Row(
                                          children: [
                                            Text(
                                                "\u{20B9}${todayDealI.mrpAmount}",
                                                style: TextStyle(
                                                    fontFamily: FontHelper
                                                        .montserratMedium,
                                                    fontSize: 18,
                                                    color:
                                                        ColorHelper.hsBlack)),
                                            const Spacer(),
                                            InkWell(
                                              onTap: () {
                                                if (todayDealI.bookedStatus ==
                                                    1) {
                                                  SnackBarHelper.getWarningMsg(
                                                      'Already booked this item');
                                                } else {
                                                  CartDataHelper.addToCartTest(
                                                          todayDealI.id)
                                                      .then((value) {
                                                    controller
                                                        .fetchTodayDealDetails(
                                                            controller
                                                                    .currentIndex +
                                                                1);
                                                  });
                                                }
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: todayDealI
                                                                .bookedStatus ==
                                                            1
                                                        ? ColorHelper.hsPrime
                                                            .withOpacity(0.2)
                                                        : ColorHelper.hsPrime),
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        15, 8, 15, 8),
                                                child: Text(
                                                  todayDealI.bookedStatus == 1
                                                      ? "Booked"
                                                      : "+ Book Now",
                                                  style: const TextStyle(
                                                      fontFamily: FontHelper
                                                          .montserratRegular,
                                                      fontSize: 13,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            if (controller.todayDealModel.value
                                        .todayDetailsData!.data!.length ==
                                    10 ||
                                index + 1 !=
                                    controller.todayDealModel.value
                                        .todayDetailsData!.data!.length)
                              Container()
                            else
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 1.5),
                            index + 1 ==
                                    controller.todayDealModel.value
                                        .todayDetailsData!.data!.length
                                ? CustomPaginationWidget(
                                    currentPage: controller.currentIndex.value,
                                    lastPage: controller.todayDealModel.value
                                        .todayDetailsData!.lastPage!,
                                    onPageChange: (page) {
                                      controller.currentIndex.value = page - 1;
                                      controller.fetchTodayDealDetails(
                                          controller.currentIndex.value + 1);
                                    },
                                  )
                                : Container(),
                          ],
                        ),
                      );
                    },
                  ),
                )),
    );
  }
}
