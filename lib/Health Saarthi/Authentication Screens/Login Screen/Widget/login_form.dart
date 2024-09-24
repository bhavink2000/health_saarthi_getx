import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/font_&_color_helper.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/Authentication%20Screens/Login%20Screen/Controller/login_controller.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/Authentication%20Screens/Login%20Screen/Forgot%20Password%20Screen/forgot_password_screen.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/Authentication%20Screens/Signup%20Screen/signup_screen.dart';
import 'package:shimmer/shimmer.dart';

import 'fade_slide_transtion.dart';

class LoginForm extends StatelessWidget {
  final Animation<double> animation;
  LoginForm({super.key, required this.animation});
  final controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    final height = Get.height - MediaQuery.of(context).padding.top;
    final space =
        height > 650 ? SpacingHelper.hsSpaceM : SpacingHelper.hsSpaceS;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: PaddingHelper.hsPaddingL),
      child: Form(
        key: controller.loginFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            FadeSlideTransition(
              animation: animation,
              additionalOffset: 0.0,
              child: TextFormField(
                  controller: controller.mobileNumber,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(10),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    contentPadding:
                        const EdgeInsets.all(PaddingHelper.hsPaddingM),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.black.withOpacity(0.12)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.black.withOpacity(0.12)),
                    ),
                    hintText: 'Mobile number',
                    hintStyle: const TextStyle(
                      color: Colors.black54,
                      fontFamily: FontHelper.montserratMedium,
                    ),
                    prefixIcon: const Icon(
                      Icons.phone_android_rounded,
                      color: Colors.black87,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter mobile number';
                    }
                    return null;
                  }),
            ),
            SizedBox(height: space),
            FadeSlideTransition(
              animation: animation,
              additionalOffset: space,
              child: Obx(
                () => TextFormField(
                  controller: controller.password,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  obscureText: controller.obScured.value,
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.all(PaddingHelper.hsPaddingM),
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.black.withOpacity(0.12)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.black.withOpacity(0.12)),
                    ),
                    hintText: 'Password',
                    hintStyle: const TextStyle(
                        color: Colors.black54,
                        fontFamily: FontHelper.montserratMedium),
                    prefixIcon: const Icon(Icons.lock_open_rounded,
                        color: Colors.black87),
                    suffixIcon: InkWell(
                      onTap: controller.togglePasswordView,
                      child: Icon(
                        controller.obScured.value
                            ? Icons.visibility_off_rounded
                            : Icons.visibility_rounded,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
                    }
                    return null;
                  },
                ),
              ),
            ),
            SizedBox(height: space),
            SizedBox(height: space),
            FadeSlideTransition(
                animation: animation,
                additionalOffset: 2 * space,
                child: InkWell(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => ForgotPasswordScreen()));
                      Get.to(() => const ForgotPasswordScreen());
                    },
                    child: Text(
                      "Forgot password",
                      style: TextStyle(
                          fontFamily: FontHelper.montserratMedium,
                          color: ColorHelper.hsPrime,
                          letterSpacing: 1),
                    ))),
            SizedBox(height: space),
            SizedBox(height: space),
            FadeSlideTransition(
              animation: animation,
              additionalOffset: 2 * space,
              child: InkWell(
                onTap: () async {
                  if (controller.loginFormKey.currentState!.validate()) {
                    controller.getLogin();
                  }
                },
                child: Obx(
                  () => controller.loginLoading.value == false
                      ? Container(
                          width: Get.width,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: ColorHelper.hsPrime),
                          child: const Text(
                            "Login to continue",
                            style: TextStyle(
                                fontFamily: FontHelper.montserratMedium,
                                color: Colors.white),
                          ),
                        )
                      : Shimmer.fromColors(
                          baseColor: ColorHelper.hsPrime,
                          period: const Duration(milliseconds: 500),
                          highlightColor: Colors.white.withOpacity(0.6),
                          child: Container(
                            width: Get.width,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: ColorHelper.hsPrime),
                          )),
                ),
              ),
            ),
            SizedBox(height: space),
            FadeSlideTransition(
              animation: animation,
              additionalOffset: 4 * space,
              child: InkWell(
                onTap: () {
                  Get.to(() => SignupScreen());
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 1,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: ColorHelper.hsBlack),
                  child: const Text(
                    "Create an account",
                    style: TextStyle(
                        fontFamily: FontHelper.montserratMedium,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
