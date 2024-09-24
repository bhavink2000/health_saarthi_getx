import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/font_&_color_helper.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/Authentication%20Screens/Login%20Screen/Controller/login_controller.dart';

import '../../App Helper/Check Internet Helper/Bindings/dependency_injection.dart';
import 'Widget/login_form.dart';
import 'Widget/login_header.dart';
import 'Widget/top_clipper.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    NetworkDependencyInjection.init();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorHelper.hsWhite,
      body: Stack(
        children: <Widget>[
          AnimatedBuilder(
            animation: controller.whiteTopClipperAnimation,
            builder: (_, Widget? child) {
              return ClipPath(
                clipper: WhiteTopClipper(
                  yOffset: controller.whiteTopClipperAnimation.value,
                ),
                child: child,
              );
            },
            child: Container(color: ColorHelper.hsGrey),
          ),
          AnimatedBuilder(
            animation: controller.greyTopClipperAnimation,
            builder: (_, Widget? child) {
              return ClipPath(
                clipper: GreyTopClipper(
                  yOffset: controller.greyTopClipperAnimation.value,
                ),
                child: child,
              );
            },
            child: Container(color: ColorHelper.hsPrime),
          ),
          AnimatedBuilder(
            animation: controller.blueTopClipperAnimation,
            builder: (_, Widget? child) {
              return ClipPath(
                clipper: BlueTopClipper(
                  yOffset: controller.blueTopClipperAnimation.value,
                ),
                child: child,
              );
            },
            child: Container(color: ColorHelper.hsWhite),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: PaddingHelper.hsPaddingL),
              child: Column(
                children: <Widget>[
                  LoginHeader(animation: controller.headerTextAnimation),
                  const SizedBox(height: 170),
                  // const SizedBox(height: 170),
                  LoginForm(
                    animation: controller.formElementAnimation,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
