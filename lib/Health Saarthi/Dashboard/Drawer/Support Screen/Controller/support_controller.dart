import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Netwok%20Helper/api_url_helper.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/snakebar_helper.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/Dashboard/dashboard.dart';
import 'package:http/http.dart' as http;

class SupportController extends GetxController {
  final fName = TextEditingController();
  final mobile = TextEditingController();
  final email = TextEditingController();
  final message = TextEditingController();
  final description = TextEditingController();

  RxBool complain = false.obs;
  RxBool help = false.obs;
  RxBool rating = false.obs;
  RxBool reason = false.obs;
  RxString dropdownValue = ''.obs;
  RxString? reasonValue;
  RxDouble ratingValue = 0.0.obs;

  GlobalKey<FormState> supportFormKey = GlobalKey<FormState>();

  final box = GetStorage();

  void sendSupport() async {
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${box.read('accessToken')}',
    };
    var type = dropdownValue.value == 'Complaint'
        ? 0
        : dropdownValue.value == 'Help'
            ? 1
            : 2;
    await http.post(Uri.parse(ApiHelper.supportUrls), headers: headers, body: {
      'name': fName.text,
      'mobile_no': mobile.text,
      'email_id': email.text,
      'type': type.toString(),
      'massage': message.text,
      'rating_count': ratingValue.toString(),
    }).then((response) {
      log(response.body);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        var msg = data['message'];
        if (data['status'] == 200) {
          SnackBarHelper.getSuccessMsg('$msg');
          Get.off(() => const Dashboard());
        }
      } else {
        if (response.statusCode == 400) {
          var data = json.decode(response.body);
          var errorMsg = data['error']['email_id'][0];
          if (data['status'] == 400) {
            SnackBarHelper.getWarningMsg('$errorMsg');
          }
        }
      }
    });
  }

  void sendRequestManagement() async {
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${box.read('accessToken')}',
    };
    var reasonType = reasonValue?.value == 'Payment' ? 0 : 1;
    await http.post(Uri.parse(ApiHelper.requestManagementUrls),
        headers: headers,
        body: {
          'reason': reasonType.toString(),
          'description': description.text,
        }).then((response) {
      log(response.body);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        var msg = data['message'];
        if (data['status'] == 200) {
          SnackBarHelper.getSuccessMsg('$msg');
          Get.off(() => const Dashboard());
        }
      } else {
        if (response.statusCode == 400) {
          var data = json.decode(response.body);
          var errorMsg = data['error']['email_id'][0];
          if (data['status'] == 400) {
            SnackBarHelper.getWarningMsg('$errorMsg');
          }
        }
      }
    });
  }
}
