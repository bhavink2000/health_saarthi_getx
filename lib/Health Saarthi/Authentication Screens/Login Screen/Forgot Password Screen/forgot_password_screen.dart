import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/snakebar_helper.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/Authentication%20Screens/Login%20Screen/Forgot%20Password%20Screen/Controller/forgot_password_controller.dart';
import 'package:shimmer/shimmer.dart';

import '../../../App Helper/app_text_helper.dart';
import '../../../App Helper/font_&_color_helper.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgotPasswordController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: SafeArea(
        child: Container(
          width: Get.width,
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 24),
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade50,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/Gif/otp_verify.gif',
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Forgot password',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                    "Enter your mobile number. we'll send you a verification code.",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black38),
                    textAlign: TextAlign.center),
                const SizedBox(height: 28),
                Container(
                  padding: const EdgeInsets.all(28),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controller.otpText,
                        keyboardType: TextInputType.phone,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(12),
                        ],
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.black12),
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.black12),
                                borderRadius: BorderRadius.circular(10)),
                            hintText: 'Enter mobile no',
                            hintStyle: const TextStyle(fontSize: 16),
                            contentPadding: const EdgeInsets.only(left: 10)),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter mobile number';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: InkWell(
                          onTap: () async {
                            if (controller.mobileLoading.value == false) {
                              if (controller.otpText.text.isEmpty) {
                                SnackBarHelper.getWarningMsg(
                                    AppTextHelper.enterMobileNo);
                              } else {
                                await controller.verifyMobileNumber();
                              }
                            }
                          },
                          child: Obx(
                            () => controller.mobileLoading.value == false
                                ? Container(
                                    width: Get.width,
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.fromLTRB(
                                        15, 10, 15, 10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: ColorHelper.hsPrime),
                                    child: const Text(
                                      "Send",
                                      style: TextStyle(
                                          fontFamily:
                                              FontHelper.montserratMedium,
                                          color: Colors.white),
                                    ),
                                  )
                                : Shimmer.fromColors(
                                    baseColor: ColorHelper.hsPrime,
                                    period: const Duration(milliseconds: 500),
                                    highlightColor:
                                        Colors.white.withOpacity(0.6),
                                    child: Container(
                                      width: Get.width,
                                      height: 40,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: ColorHelper.hsPrime),
                                    )),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
