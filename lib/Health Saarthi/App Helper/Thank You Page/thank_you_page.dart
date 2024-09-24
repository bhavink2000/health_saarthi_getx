import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/Dashboard/dashboard.dart';

import '../font_&_color_helper.dart';

class ThankYouPage extends StatelessWidget {
  const ThankYouPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ThankYouController());
    double screenHeight = Get.height;

    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 50,
              ),
              const Image(
                image: AssetImage("assets/health_saarthi_logo.png"),
                width: 200,
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: Get.width,
                height: Get.height / 5,
                child: const Image(
                  image: AssetImage("assets/Gif/thank_you.gif"),
                  width: 200,
                ),
              ),
              SizedBox(height: screenHeight * 0.1),
              Text(
                "Thank You!",
                style: TextStyle(
                  color: ColorHelper.hsPrimeOne,
                  fontFamily: FontHelper.montserratMedium,
                  fontSize: 36,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Text(
                "Your Booking Confirm",
                style: TextStyle(
                  color: ColorHelper.hsPrimeOne,
                  fontFamily: FontHelper.montserratRegular,
                  fontSize: 17,
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "You will be redirected to the home page shortly\nor click here to return to home page",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black54,
                      fontFamily: FontHelper.montserratRegular,
                      fontSize: 14,
                      letterSpacing: 0.5),
                ),
              ),
              SizedBox(height: screenHeight * 0.06),
              Flexible(
                child: InkWell(
                  onTap: () {
                    Get.offAll(() => const Dashboard());
                  },
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: ColorHelper.hsPrime),
                    child: const Text(
                      "Home",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: FontHelper.montserratMedium,
                          letterSpacing: 1),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ThankYouController extends GetxController {
  @override
  void onInit() {
    Future.delayed(
        const Duration(seconds: 20), () => Get.to(() => const Dashboard()));
    super.onInit();
  }
}
