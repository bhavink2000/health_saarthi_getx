import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Token%20Helper/authentication_manager.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/font_&_color_helper.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/Dashboard/Bottom%20Menu%20Screens/Home%20Menu/Controller/home_controller.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/Dashboard/Bottom%20Menu%20Screens/Home%20Menu/Widget/home_body_checkups.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/Dashboard/Bottom%20Menu%20Screens/Home%20Menu/Widget/home_offers.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/Dashboard/Bottom%20Menu%20Screens/Home%20Menu/Widget/home_test_package.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/Dashboard/Bottom%20Menu%20Screens/Home%20Menu/Widget/image_slider.dart';
import '../../Global Search/global_search_screen.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    Card(
                      elevation: 0,
                      margin: EdgeInsets.zero,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4))),
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            color: ColorHelper.hsPrime.withOpacity(0.1),
                            border: Border.all(
                                color: ColorHelper.hsPrime, width: 0.2),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(4))),
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: TextFormField(
                          autofocus: false,
                          readOnly: true,
                          decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.fromLTRB(10, 0, 0, 0),
                              border: InputBorder.none,
                              hintText: 'Search for Tests, Package',
                              hintStyle: const TextStyle(
                                  fontSize: 12,
                                  fontFamily: FontHelper.montserratRegular),
                              prefixIcon:
                                  const Icon(Icons.search_rounded, size: 20),
                              focusColor: ColorHelper.hsPrime),
                          onChanged: (value) {},
                          onTap: () {
                            showSearch(
                                context: context,
                                delegate: GlobalSearch(
                                    accessToken:
                                        AuthenticationManager.getToken()));
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const HomeImageSlider(),
                    const HomeTestPackage(),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const HomeOffers(),
              const HomeBodyCheckups(),
              const SizedBox(height: 70),
            ],
          ),
        ));
  }
}
