import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Netwok%20Helper/api_url_helper.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/snakebar_helper.dart';
import 'package:http/http.dart' as http;

class ForgotPasswordUpdateController extends GetxController {
  final String mobileNumber;
  ForgotPasswordUpdateController({required this.mobileNumber});

  final password = TextEditingController();
  final cPassword = TextEditingController();

  RxBool obScured = true.obs;
  void togglePasswordView() => obScured.value = !obScured.value;

  RxBool obCScured = true.obs;
  void toggleCPasswordView() => obCScured.value = !obCScured.value;

  Future<dynamic> getForgotPass() async {
    try {
      final response = await http.post(
        Uri.parse(ApiHelper.forgotPasswordUrl),
        body: {
          'mobile': mobileNumber,
          'password': password.text,
          'confirm_password': cPassword.text,
        },
      );
      var forgotData = json.decode(response.body);
      print("forgot data->$forgotData");
      if (forgotData['status'] == 200) {
        var msg = forgotData['message'];
        SnackBarHelper.getWarningMsg('$msg');
        return forgotData['status'];
      } else if (forgotData['status'] == 400) {
        if (forgotData['status'] == 400) {
          var errorMsg = forgotData['error']['password'][0];
          SnackBarHelper.getWarningMsg('$errorMsg');
        } else {
          var errorMsg = forgotData['message'];
          SnackBarHelper.getWarningMsg('$errorMsg');
        }
      } else {
        Get.back();
      }
    } catch (e) {
      print("forgot e->$e");
      Get.back();
    }
  }
}
