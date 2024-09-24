import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Netwok%20Helper/api_url_helper.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/snakebar_helper.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/Authentication%20Screens/Login%20Screen/Forgot%20Password%20Screen/OTP%20Verification%20Screen/Forgot%20Password%20Update/forgot_password_update.dart';
import 'package:http/http.dart' as http;

class OTPVerificationController extends GetxController {
  final String mobileNumber;
  OTPVerificationController({required this.mobileNumber});

  final otpVerify = TextEditingController();

  RxInt secondsRemaining = 30.obs;
  RxBool enableResend = false.obs;
  Timer? timer;

  @override
  void onInit() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (secondsRemaining.value != 0) {
        secondsRemaining.value--;
      } else {
        enableResend(true);
      }
    });
    super.onInit();
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }

  Future<String?> submitOtp() async {
    await http.post(Uri.parse(ApiHelper.verifyOtpUrl), body: {
      'mobile': mobileNumber.toString(),
      'otp': otpVerify.text,
    }).then((response) {
      var data = json.decode(response.body);
      if (data['status'] == 200) {
        SnackBarHelper.getSuccessMsg('${data['message']}');
        Get.off(() => ForgotPasswordUpdateScreen(mobileNumber: mobileNumber));
      } else if (data['status'] == 400) {
        print("in else if");
        Get.back();
        SnackBarHelper.getWarningMsg('${data['message']}');
      } else {
        print("error");
      }
    });
    return null;
  }

  Future<String?> resendOTP() async {
    Get.dialog(
        Dialog(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(), // Loading indicator
                SizedBox(height: 16),
                Text(
                  'Resending OTP...', // Loading message
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
        barrierDismissible: false);
    final response = await http.post(
      Uri.parse(ApiHelper.reSendOtpUrl),
      body: {
        'mobile': mobileNumber,
      },
    );
    Get.back();
    var data = json.decode(response.body);
    if (data['status'] == 200) {
      SnackBarHelper.getSuccessMsg('${data['message']}');

      secondsRemaining.value = 30;
      enableResend.value = false;
    } else if (data['status'] == 400) {
      var errorMsg = data['error']['mobile'][0];
      SnackBarHelper.getWarningMsg('$errorMsg');
    }
    return null;
  }
}
