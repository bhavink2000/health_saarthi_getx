import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'font_&_color_helper.dart';

class LoadingHelper {
  static void onLoad() {
    Get.dialog(const LoadingOnly(), barrierDismissible: false);
  }

  static void onLoadExit() {
    Get.back();
  }
}

class LoadingLogin extends StatelessWidget {
  const LoadingLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
                child: Image.asset("assets/Gif/loader.gif",
                    width: 70, color: ColorHelper.hsPrime)),
            const SizedBox(height: 10),
            const Text(
              'Login...',
              style: TextStyle(
                  fontFamily: FontHelper.montserratMedium, fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}

class LoadingOnly extends StatelessWidget {
  const LoadingOnly({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
                child: Image.asset("assets/Gif/loader.gif",
                    width: 70, color: ColorHelper.hsPrime)),
            const SizedBox(height: 10),
            const Text(
              'Loading...',
              style: TextStyle(
                  fontFamily: FontHelper.montserratMedium, fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}

class CenterLoading extends StatelessWidget {
  const CenterLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Image.asset("assets/Gif/loader.gif",
            width: 70, color: ColorHelper.hsPrime));
  }
}
