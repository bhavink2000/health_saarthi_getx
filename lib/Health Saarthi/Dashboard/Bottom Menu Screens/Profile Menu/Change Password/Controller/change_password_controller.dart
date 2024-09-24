import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/snakebar_helper.dart';
import 'package:http/http.dart' as http;

import '../../../../../App Helper/Netwok Helper/api_url_helper.dart';

class ChangePasswordController extends GetxController {
  final currentPassword = TextEditingController();
  final password = TextEditingController();
  final cPassword = TextEditingController();

  RxBool obScured = true.obs;
  void togglePasswordView() {
    obScured.value = !obScured.value;
  }

  RxBool obCScured = true.obs;
  void toggleCPasswordView() {
    obCScured.value = !obCScured.value;
  }

  GlobalKey<FormState> changePasswordFormKey = GlobalKey<FormState>();

  void getChangePass() async {
    final box = GetStorage();
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${box.read('accessToken')}',
    };
    Map<String, String> body = {
      'current_password': currentPassword.text,
      'password': password.text,
      'confirm_password': cPassword.text,
    };
    final response = await http.post(Uri.parse(ApiHelper.changePasswordUrl),
        headers: headers, body: body);

    var responseBody = jsonDecode(response.body);
    log(responseBody.toString());
    if (response.statusCode == 200) {
      var msg = responseBody['message'];
      if (responseBody['status'] == 200) {
        Get.back();
        SnackBarHelper.getSuccessMsg('$msg');
      }
    } else if (response.statusCode == 400) {
      if (responseBody['status'] == 400) {
        var errorMsg = responseBody['message'];
        SnackBarHelper.getWarningMsg('$errorMsg');
      }
    }
  }
}
