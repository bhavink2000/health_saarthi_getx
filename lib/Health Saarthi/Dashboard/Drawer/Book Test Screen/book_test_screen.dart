import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/font_&_color_helper.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/Dashboard/Bottom%20Menu%20Screens/Home%20Menu/Widget/home_test_package.dart';

class BookTestScreen extends StatelessWidget {
  const BookTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: ColorHelper.hsPrime,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: const [
          Text(
            "Book Test",
            style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontFamily: FontHelper.montserratMedium,
                letterSpacing: 1),
          ),
          SizedBox(width: 10)
        ],
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
        child: const HomeTestPackage(),
      ),
    );
  }
}
