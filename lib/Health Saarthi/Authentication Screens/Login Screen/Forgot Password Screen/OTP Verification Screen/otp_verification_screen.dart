import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/font_&_color_helper.dart';

import '../../../../App Helper/app_text_helper.dart';
import '../../../../App Helper/snakebar_helper.dart';
import 'Controller/otp_verification_controller.dart';

class OTPVerificationScreen extends StatelessWidget {
  final String mobileNumber;
  const OTPVerificationScreen({super.key, required this.mobileNumber});

  @override
  Widget build(BuildContext context) {
    final controller =
        Get.put(OTPVerificationController(mobileNumber: mobileNumber));
    Color clr = const Color(0xfff7f6fb);
    return Scaffold(
      backgroundColor: clr,
      appBar: AppBar(backgroundColor: clr),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
              'Verification',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Enter your OTP code number",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black38,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 28),
            Container(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                        child: TextField(
                          readOnly: true,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.all(PaddingHelper.hsPaddingM),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black.withOpacity(0.12)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black.withOpacity(0.12)),
                            ),
                            hintText: mobileNumber,
                            hintStyle: const TextStyle(
                                color: Colors.black54,
                                fontFamily: FontHelper.montserratRegular,
                                fontSize: 14),
                            prefixIcon: Icon(Icons.phone_android_rounded,
                                color: ColorHelper.hsBlack, size: 20),
                          ),
                        ),
                      )),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                        child: TextField(
                          controller: controller.otpVerify,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.all(PaddingHelper.hsPaddingM),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black.withOpacity(0.12)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black.withOpacity(0.12)),
                            ),
                            hintText: 'OTP',
                            hintStyle: const TextStyle(
                                color: Colors.black54,
                                fontFamily: FontHelper.montserratRegular,
                                fontSize: 14),
                            prefixIcon: Icon(Icons.code_rounded,
                                color: ColorHelper.hsBlack, size: 20),
                          ),
                        ),
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (controller.otpVerify.text.isEmpty) {
                          SnackBarHelper.getWarningMsg(AppTextHelper.enterOTP);
                        } else {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return Dialog(
                                child: Container(
                                  padding: const EdgeInsets.all(20),
                                  child: const Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CircularProgressIndicator(), // Loading indicator
                                      SizedBox(height: 16),
                                      Text(
                                        'Submitting OTP...', // Loading message
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                          await controller.submitOtp();
                        }
                      },
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            ColorHelper.hsPrime),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(14.0),
                        child: Text(
                          'Verify',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Obx(
                    () => Text(
                      "Time remaining ${controller.secondsRemaining.value} sec",
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black38,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            const Text(
              "Didn't you receive any code?",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black38,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 18),
            Obx(
              () => TextButton(
                onPressed: () {
                  controller.otpVerify.clear();
                  controller.enableResend.value
                      ? controller.resendOTP()
                      : SnackBarHelper.getWarningMsg(AppTextHelper.resendOTP);
                },
                child: Text(
                  "Resend New Code",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: controller.enableResend.value
                        ? ColorHelper.hsPrimeOne
                        : Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
