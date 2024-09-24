import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Netwok%20Helper/api_url_helper.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/snakebar_helper.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/Authentication%20Screens/Login%20Screen/Forgot%20Password%20Screen/OTP%20Verification%20Screen/otp_verification_screen.dart';
import 'package:http/http.dart' as http;

class ForgotPasswordController extends GetxController {
  final otpText = TextEditingController();

  RxBool mobileLoading = false.obs;
  Future<void> verifyMobileNumber() async {
    mobileLoading.value = true;
    final response = await http.post(
      Uri.parse(ApiHelper.sendOtpUrl),
      body: {
        'mobile': otpText.text,
      },
    );
    var data = json.decode(response.body);
    if (data['status'] == 200) {
      SnackBarHelper.getWarningMsg('${data['message']}');
      Get.off(() => OTPVerificationScreen(mobileNumber: otpText.text));
      mobileLoading.value = false;
    } else if (data['status'] == 400) {
      var errorMsg = data['error']['mobile'][0];
      Get.back();
      SnackBarHelper.getWarningMsg('$errorMsg');
      mobileLoading.value = false;
    }
  }
}
