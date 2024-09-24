import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/font_&_color_helper.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/Dashboard/Add%20To%20Cart/Test%20Cart/Controller/test_cart_controller.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/Dashboard/Add%20To%20Cart/Test%20Cart/Widget/select_location_type.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/Dashboard/Add%20To%20Cart/Test%20Cart/Widget/test_cart_appbar.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/Dashboard/Bottom%20Menu%20Screens/Home%20Menu/Controller/home_controller.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/Dashboard/Bottom%20Menu%20Screens/Home%20Menu/Package%20List/package_list.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/Dashboard/Bottom%20Menu%20Screens/Home%20Menu/Test%20List/test_list_items.dart';

import '../../../App Helper/loading_helper.dart';
import 'Widget/cart_bottomsheet.dart';
import 'Widget/cart_product_list_widgets.dart';

class TestCart extends StatelessWidget {
  const TestCart({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TestCartController());
    final homeController = Get.find<HomeController>();
    return PopScope(
      canPop: true,
      onPopInvoked: (val) {
        homeController.fetchPopularPackages();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: testCartAppbar(),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SelectLocationType(),
              Obx(() => controller.cartLoading.value
                  ? Column(
                      children: [
                        SizedBox(
                          height: Get.height / 4,
                        ),
                        const CenterLoading(),
                      ],
                    )
                  : SizedBox(
                      width: Get.width,
                      child: Column(
                        children: [
                          controller.cartModel
                                      .value.data!.cartItems!.testItems!.isEmpty &&
                                  controller.cartModel.value.data!.cartItems!
                                      .packageItems!.isEmpty &&
                                  controller.cartModel.value.data!.cartItems!
                                      .profileItems!.isEmpty
                              ? Center(
                                  child: Column(
                                  children: [
                                    SizedBox(
                                      height: Get.height / 4,
                                    ),
                                    const Text("Cart is empty",
                                        style: TextStyle(
                                            fontFamily:
                                                FontHelper.montserratMedium,
                                            fontSize: 16),
                                        textAlign: TextAlign.center),
                                  ],
                                ))
                              : SizedBox(
                                  width: Get.width,
                                  child: SingleChildScrollView(
                                    physics: const BouncingScrollPhysics(),
                                    padding: EdgeInsets.fromLTRB(
                                        0, 0, 0, Get.height / 4),
                                    child: Column(
                                      children: [
                                        Obx(() => controller
                                                .cartModel
                                                .value
                                                .data!
                                                .cartItems!
                                                .testItems!
                                                .isNotEmpty
                                            ? CartItemWidget(
                                                cartItem: controller
                                                    .cartModel
                                                    .value
                                                    .data
                                                    ?.cartItems
                                                    ?.testItems,
                                                scrollController: controller
                                                    .testScrollController,
                                                cartItemLabel: 'Tests',
                                                addOnPressed: () {
                                                  Get.off(() =>
                                                      const TestListItems());
                                                },
                                                globalSettingItemSlot:
                                                    controller
                                                        .cartModel
                                                        .value
                                                        .data
                                                        ?.globalSettingTestSlot,
                                                itemDiscount: 'Test discount',
                                                dropdownValue:
                                                    controller.testD.value,
                                                dropdownOnChange: (newValue) {
                                                  controller.testD.value =
                                                      newValue!;
                                                  controller.cartCalculation();
                                                },
                                              )
                                            : Container()),
                                        //profile
                                        const SizedBox(height: 10),
                                        Obx(
                                          () => controller
                                                  .cartModel
                                                  .value
                                                  .data!
                                                  .cartItems!
                                                  .profileItems!
                                                  .isNotEmpty
                                              ? CartItemWidget(
                                                  cartItem: controller
                                                      .cartModel
                                                      .value
                                                      .data
                                                      ?.cartItems
                                                      ?.profileItems,
                                                  scrollController: controller
                                                      .profileScrollController,
                                                  cartItemLabel: 'Profile',
                                                  addOnPressed: () {
                                                    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>TestListItems()));
                                                  },
                                                  globalSettingItemSlot: controller
                                                      .cartModel
                                                      .value
                                                      .data
                                                      ?.globalSettingProfileSlot,
                                                  itemDiscount:
                                                      'Profile discount',
                                                  dropdownValue:
                                                      controller.profileD.value,
                                                  dropdownOnChange: (newValue) {
                                                    controller.profileD.value =
                                                        newValue!;
                                                    controller
                                                        .cartCalculation();
                                                  },
                                                )
                                              : Container(),
                                        ),
                                        //package
                                        const SizedBox(height: 10),
                                        Obx(
                                          () => controller
                                                  .cartModel
                                                  .value
                                                  .data!
                                                  .cartItems!
                                                  .packageItems!
                                                  .isNotEmpty
                                              ? CartItemWidget(
                                                  cartItem: controller
                                                      .cartModel
                                                      .value
                                                      .data
                                                      ?.cartItems
                                                      ?.packageItems,
                                                  scrollController: controller
                                                      .packageScrollController,
                                                  cartItemLabel: 'Package',
                                                  addOnPressed: () {
                                                    Get.off(() =>
                                                        const PackageListItems());
                                                    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>TestListItems()));
                                                  },
                                                  globalSettingItemSlot: controller
                                                      .cartModel
                                                      .value
                                                      .data
                                                      ?.globalSettingPackageSlot,
                                                  itemDiscount:
                                                      'Package discount',
                                                  dropdownValue:
                                                      controller.packageD.value,
                                                  dropdownOnChange: (newValue) {
                                                    controller.packageD.value =
                                                        newValue!;
                                                    controller
                                                        .cartCalculation();
                                                  },
                                                )
                                              : Container(),
                                        ),
                                        Obx(
                                          () => controller
                                                  .cartModel
                                                  .value
                                                  .data!
                                                  .cartItems!
                                                  .testItems!
                                                  .isNotEmpty
                                              ? Container()
                                              : Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 0.0),
                                                  child: CommonAddItemsWidget(
                                                      label: 'Test',
                                                      onTap: () {
                                                        Get.off(() =>
                                                            const TestListItems());
                                                      }),
                                                ),
                                        ),
                                        Obx(
                                          () => controller
                                                  .cartModel
                                                  .value
                                                  .data!
                                                  .cartItems!
                                                  .profileItems!
                                                  .isNotEmpty
                                              ? Container()
                                              : Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 0.0),
                                                  child: CommonAddItemsWidget(
                                                      label: 'Profile',
                                                      onTap: () {}),
                                                ),
                                        ),
                                        Obx(
                                          () => controller
                                                  .cartModel
                                                  .value
                                                  .data!
                                                  .cartItems!
                                                  .packageItems!
                                                  .isNotEmpty
                                              ? Container()
                                              : Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 10.0),
                                                  child: CommonAddItemsWidget(
                                                      label: 'Package',
                                                      onTap: () {
                                                        Get.off(() =>
                                                            const PackageListItems());
                                                      }),
                                                ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    )),
              const SizedBox(height: 50)
            ],
          ),
        ),
        bottomSheet: Obx(() => testCartBottomsheet()),
      ),
    );
  }
}
