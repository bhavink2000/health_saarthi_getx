import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Frontend%20Helper/shimmar_helper.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Netwok%20Helper/Cart%20Data%20Helper/cart_data_helper.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/font_&_color_helper.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/Dashboard/Bottom%20Menu%20Screens/Home%20Menu/Package%20List/Package%20Item%20Details/package_items_details.dart';

import '../Controller/home_controller.dart';

class HomeBodyCheckups extends StatefulWidget {
  const HomeBodyCheckups({super.key});

  @override
  State<HomeBodyCheckups> createState() => _HomeBodyCheckupsState();
}

class _HomeBodyCheckupsState extends State<HomeBodyCheckups> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return SizedBox(
      width: Get.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: Text(
              "Popular package's",
              style: TextStyle(
                  fontFamily: FontHelper.montserratMedium,
                  fontSize: 14,
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Obx(
            () => Container(
                width: Get.width,
                height: Get.height / 3.6,
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: controller.popularPackageLoading.value
                    ? ShimmerHelper(
                        child: ListView.builder(
                            itemCount: 2,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.only(
                                    top: 10, right: 10, bottom: 10),
                                width: Get.width / 1.2,
                                height: 300,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color:
                                        ColorHelper.hsPrime.withOpacity(0.5)),
                              );
                            }))
                    : controller.popularPackageData.isNotEmpty
                        ? ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            itemCount: controller.popularPackageData.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.fromLTRB(0, 5, 10, 5),
                                child: InkWell(
                                  onTap: () {
                                    //Navigator.push(context, MaterialPageRoute(builder: (context)=>TestListItems()));
                                  },
                                  child: Container(
                                    width: Get.width / 1.2,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: const DecorationImage(
                                          image: AssetImage(
                                              "assets/Home/box-bg.png"),
                                          fit: BoxFit.fill),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              25, 60, 10, 5),
                                          child: Text(
                                            "${controller.popularPackageData[index]['max_service_name']}",
                                            style: const TextStyle(
                                                fontFamily:
                                                    FontHelper.montserratMedium,
                                                fontSize: 16,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              25, 5, 10, 5),
                                          child: Text(
                                            "${controller.popularPackageData[index]['test_management']['service_classification']}",
                                            style: const TextStyle(
                                                fontFamily: FontHelper
                                                    .montserratRegular,
                                                color: Colors.black,
                                                fontSize: 12),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              25, 0, 10, 5),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    color: Colors.white),
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        20, 5, 20, 5),
                                                child: Text(
                                                    "\u{20B9}${controller.popularPackageData[index]['test_management']['mrp']}",
                                                    style: TextStyle(
                                                      fontFamily: FontHelper
                                                          .montserratMedium,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          ColorHelper.hsPrime,
                                                    )),
                                              ),
                                              InkWell(
                                                  onTap: () {
                                                    Get.to(() => PackageItemsDetails(
                                                        packageId: controller
                                                                        .popularPackageData[
                                                                    index][
                                                                'test_management']
                                                            ['id']));
                                                  },
                                                  child: Row(
                                                    children: [
                                                      Text("Know More",
                                                          style: TextStyle(
                                                              fontFamily: FontHelper
                                                                  .montserratMedium,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: ColorHelper
                                                                  .hsPrime,
                                                              fontSize: 12)),
                                                      const SizedBox(width: 10),
                                                      CircleAvatar(
                                                        radius: 20,
                                                        backgroundColor:
                                                            ColorHelper.hsPrime,
                                                        child: const Icon(
                                                            Icons.add,
                                                            color: Colors.white,
                                                            size: 20),
                                                      )
                                                    ],
                                                  )),
                                            ],
                                          ),
                                        ),
                                        const Spacer(),
                                        InkWell(
                                          onTap: () {
                                            CartDataHelper.addToCartTest(
                                                    controller.popularPackageData[
                                                            index]
                                                        ['test_management_id'])
                                                .then((value) {});
                                            setState(() {
                                              controller.popularPackageData[
                                                      index]['test_management']
                                                  ['booked_status'] = 1;
                                            });
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.fromLTRB(
                                                10, 5, 10, 5),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      bottomRight:
                                                          Radius.circular(10),
                                                      bottomLeft:
                                                          Radius.circular(10)),
                                              gradient: LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: [
                                                  ColorHelper.hsPrime
                                                      .withOpacity(1),
                                                  const Color(0xff603d83),
                                                ],
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          10, 5, 10, 5),
                                                  child: Text(
                                                      controller.popularPackageData[
                                                                          index]
                                                                      [
                                                                      'test_management']
                                                                  [
                                                                  'booked_status'] ==
                                                              0
                                                          ? "Book Now"
                                                          : "Booked",
                                                      style: const TextStyle(
                                                          fontFamily: FontHelper
                                                              .montserratMedium,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ),
                                                Container(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(6, 3, 6, 3),
                                                    child: const Icon(
                                                      Icons
                                                          .shopping_cart_rounded,
                                                      color: Colors.white,
                                                      size: 20,
                                                    ))
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
                        : const Center(
                            child: Text('No popular package available'),
                          )),
          ),
        ],
      ),
    );
  }
}
