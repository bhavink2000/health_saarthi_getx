import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Frontend%20Helper/shimmar_helper.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/Dashboard/Bottom%20Menu%20Screens/Home%20Menu/Controller/home_controller.dart';
import '../../../../App Helper/font_&_color_helper.dart';

class HomeImageSlider extends StatelessWidget {
  const HomeImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Obx(() => controller.bannerLoading.value
        ? ShimmerHelper(
            child: Container(
            margin: const EdgeInsets.only(bottom: 10),
            width: Get.width,
            height: 180,
            decoration:
                BoxDecoration(color: ColorHelper.hsPrime.withOpacity(0.5)),
          ))
        : controller.bannerModel.value.data!.isEmpty
            ? Container()
            : Column(
                children: [
                  CarouselSlider.builder(
                    options: CarouselOptions(
                      viewportFraction: 1,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 2000),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.1,
                      height: 180,
                      scrollDirection: Axis.horizontal,
                    ),
                    itemCount: controller.bannerModel.value.data!.length,
                    itemBuilder: (BuildContext context, int itemIndex,
                        int pageViewIndex) {
                      var bannerI =
                          controller.bannerModel.value.data![itemIndex];
                      return SizedBox(
                        width: Get.width,
                        // height: 100,
                        child: InkWell(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             TestListItems()));
                            },
                            child: Image(
                              image: NetworkImage(bannerI.image!),
                              fit: BoxFit.fill,
                            )),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                ],
              ));
  }
}
