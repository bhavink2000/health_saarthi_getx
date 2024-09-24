import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Frontend%20Helper/shimmar_helper.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Netwok%20Helper/Cart%20Data%20Helper/cart_data_helper.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Widget%20Helper/common_appbar.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/snakebar_helper.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/Dashboard/Add%20To%20Cart/Test%20Cart/test_cart.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/Dashboard/Bottom%20Menu%20Screens/Home%20Menu/Test%20List/Controller/test_list_controller.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/Dashboard/Bottom%20Menu%20Screens/Home%20Menu/Test%20List/Test%20Item%20Details/test_items_details.dart';
import '../../../../App Helper/Frontend Helper/custom_pagination.dart';
import '../../../../App Helper/font_&_color_helper.dart';

class TestListItems extends StatelessWidget {
  const TestListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TestListController());
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: commonAppbar('Test Items'),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Card(
                elevation: 0,
                margin: EdgeInsets.zero,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4))),
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      color: ColorHelper.hsPrime.withOpacity(0.1),
                      border:
                          Border.all(color: ColorHelper.hsPrime, width: 0.2),
                      borderRadius: const BorderRadius.all(Radius.circular(4))),
                  child: TextFormField(
                    controller: controller.testSearch,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        border: InputBorder.none,
                        hintText: 'Search for Tests, Package',
                        hintStyle: const TextStyle(
                            fontSize: 12,
                            fontFamily: FontHelper.montserratRegular),
                        suffixIcon: InkWell(
                          onTap: () {
                            controller.testSearch.clear();
                            controller.fetchTest(1);
                          },
                          child: const Icon(Icons.close),
                        ),
                        focusColor: ColorHelper.hsPrime),
                    onChanged: (value) {
                      controller.fetchTest(1);
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Obx(
                  () => controller.testLoading.value
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: ShimmerHelper(
                              child: ListView.builder(
                            itemCount: 10,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Container(
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                      color:
                                          ColorHelper.hsPrime.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(5)),
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  height: 100);
                            },
                          )),
                        )
                      : controller.testModel.value.testData!.data!.isEmpty
                          ? Container(
                              width: Get.width,
                              height: Get.height / 1.3,
                              alignment: Alignment.center,
                              child: const Text("Test Not found your branch",
                                  style: TextStyle(
                                      fontFamily: FontHelper.montserratMedium,
                                      fontSize: 16),
                                  textAlign: TextAlign.center),
                            )
                          : AnimationLimiter(
                              child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: controller
                                  .testModel.value.testData?.data!.length,
                              itemBuilder: (context, index) {
                                var testI = controller
                                    .testModel.value.testData?.data![index];
                                return AnimationConfiguration.staggeredList(
                                  position: index,
                                  duration: const Duration(milliseconds: 1000),
                                  child: Column(
                                    children: [
                                      FadeInAnimation(
                                        child: Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 5, 10, 5),
                                          child: InkWell(
                                            onTap: () {
                                              Get.to(() => TestItemDetails(
                                                  testId: testI.id!));
                                            },
                                            child: Card(
                                              elevation: 5,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              shadowColor:
                                                  Colors.grey.withOpacity(0.5),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: Get.width,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                              topLeft: Radius
                                                                  .circular(10),
                                                              topRight: Radius
                                                                  .circular(
                                                                      10)),
                                                      color: ColorHelper.hsPrime
                                                          .withOpacity(0.8),
                                                    ),
                                                    padding: const EdgeInsets
                                                        .fromLTRB(
                                                        10, 10, 10, 10),
                                                    child: Text(
                                                        testI!.serviceName!,
                                                        style: const TextStyle(
                                                            fontFamily: FontHelper
                                                                .montserratMedium,
                                                            fontSize: 15,
                                                            color:
                                                                Colors.white)),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(10, 5, 0, 0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        //Divider(color: hsOne,thickness: 1),
                                                        SizedBox(
                                                            width:
                                                                Get.width / 1.5,
                                                            child: Text(
                                                              testI.specimenVolume ?? 'N/A',
                                                              style: const TextStyle(
                                                                  fontFamily:
                                                                      FontHelper
                                                                          .montserratRegular,
                                                                  letterSpacing:
                                                                      0.5,
                                                                  color: Colors
                                                                      .black87,
                                                                  fontSize: 12),
                                                            )),
                                                        Row(
                                                          children: [
                                                            Text(
                                                                "\u{20B9}${testI.mrpAmount}",
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        FontHelper
                                                                            .montserratMedium,
                                                                    fontSize:
                                                                        18,
                                                                    color: ColorHelper
                                                                        .hsBlack)),
                                                            const Spacer(),
                                                            InkWell(
                                                              onTap: () {
                                                                if (testI
                                                                        .bookedStatus ==
                                                                    1) {
                                                                  SnackBarHelper
                                                                      .getWarningMsg(
                                                                          'Already booked this item');
                                                                } else {
                                                                  CartDataHelper
                                                                          .addToCartTest(testI
                                                                              .id)
                                                                      .then(
                                                                          (value) {
                                                                    controller.fetchTest(
                                                                        controller.currentIndex.value +
                                                                            1);
                                                                  });
                                                                }
                                                              },
                                                              child: Container(
                                                                decoration: BoxDecoration(
                                                                    borderRadius: const BorderRadius
                                                                        .only(
                                                                        bottomRight:
                                                                            Radius.circular(
                                                                                10),
                                                                        topLeft:
                                                                            Radius.circular(
                                                                                10)),
                                                                    color: testI
                                                                                .bookedStatus ==
                                                                            1
                                                                        ? ColorHelper
                                                                            .hsPrime
                                                                            .withOpacity(
                                                                                0.2)
                                                                        : ColorHelper
                                                                            .hsPrime),
                                                                padding:
                                                                    const EdgeInsets
                                                                        .fromLTRB(
                                                                        15,
                                                                        8,
                                                                        15,
                                                                        8),
                                                                child: Text(
                                                                  testI.bookedStatus ==
                                                                          1
                                                                      ? "Booked"
                                                                      : "+ Book Now",
                                                                  style: const TextStyle(
                                                                      fontFamily:
                                                                          FontHelper
                                                                              .montserratRegular,
                                                                      fontSize:
                                                                          13,
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      if (controller.testModel.value.testData
                                                  ?.data!.length ==
                                              10 ||
                                          index + 1 !=
                                              controller.testModel.value
                                                  .testData?.data?.length)
                                        Container()
                                      else
                                        SizedBox(height: Get.height / 1.9),
                                      index + 1 ==
                                              controller.testModel.value
                                                  .testData!.data!.length
                                          ? CustomPaginationWidget(
                                              currentPage:
                                                  controller.currentIndex.value,
                                              lastPage: controller.testModel
                                                  .value.testData!.lastPage!,
                                              onPageChange: (page) {
                                                controller.currentIndex.value =
                                                    page - 1;
                                                controller.fetchTest(controller
                                                        .currentIndex.value +
                                                    1);
                                              },
                                            )
                                          : Container(),
                                    ],
                                  ),
                                );
                              },
                            )),
                ),
              ),
            ),
            Obx(
              () => controller.testLoading.value
                  ? Container()
                  : Container(
                      width: Get.width,
                      height: 60,
                      color: ColorHelper.hsPrime,
                      child: InkWell(
                        onTap: () {
                          Get.off(() => const TestCart());
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 5, 10, 5),
                              child: Text(
                                "Total Cart Items [ ${controller.testModel.value.cartData!.count} ]",
                                style: const TextStyle(
                                    fontFamily: FontHelper.montserratMedium,
                                    color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 8, 10, 8),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 10, 15, 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        "\u{20B9}${controller.testModel.value.cartData!.amount}",
                                        style: TextStyle(
                                            fontFamily:
                                                FontHelper.montserratRegular,
                                            color: ColorHelper.hsPrime,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(width: 5),
                                      Icon(Icons.arrow_forward_ios_rounded,
                                          size: 15, color: ColorHelper.hsPrime),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
