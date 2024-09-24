import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Frontend%20Helper/shimmar_helper.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/font_&_color_helper.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/Dashboard/Bottom%20Menu%20Screens/Home%20Menu/Controller/home_controller.dart';

import '../Today Deal/today_deal.dart';

class HomeOffers extends StatelessWidget {
  const HomeOffers({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Obx(
      () => controller.todaysDealLoading.value
          ? Column(
              children: [
                ShimmerHelper(
                    child: Container(
                        width: Get.width,
                        height: 90,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: ColorHelper.hsPrime.withOpacity(0.5)))),
                const SizedBox(height: 10)
              ],
            )
          : controller.todayDealModel.value.todayData!.isEmpty
              ? Container()
              : Container(
                  width: Get.width,
                  color: Colors.grey[200],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                        child: Text(
                          "Today's Deal",
                          style: TextStyle(
                              fontFamily: FontHelper.montserratMedium,
                              fontSize: 14,
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: SizedBox(
                          width: Get.width,
                          height: 50,
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: controller
                                .todayDealModel.value.todayData!.length,
                            itemBuilder: (context, index) {
                              var todayDeal = controller
                                  .todayDealModel.value.todayData![index];
                              return Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 0, 0, 10),
                                child: InkWell(
                                  onTap: () {
                                    Get.to(
                                        () => TodayDeal(dealId: todayDeal.id));
                                  },
                                  child: Container(
                                    width: Get.width / 1.35,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        gradient: LinearGradient(
                                          begin: Alignment.topRight,
                                          end: Alignment.bottomLeft,
                                          colors: [
                                            ColorHelper.hsPrime.withOpacity(1),
                                            ColorHelper.hsPrime.withOpacity(0.7)
                                          ],
                                        ),
                                        border: Border.all(
                                            color: ColorHelper.hsPrime,
                                            width: 0.2)),
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.only(
                                              left: 10, top: 5, bottom: 5),
                                          child: const Image(
                                            image: AssetImage(
                                                "assets/Home/discount.png"),
                                            width: 30,
                                          ),
                                        ),
                                        Text(
                                          "${todayDeal.title}",
                                          style: const TextStyle(
                                              fontFamily:
                                                  FontHelper.montserratRegular,
                                              fontSize: 13,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
    );
  }
}
