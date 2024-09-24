import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Netwok%20Helper/api_url_helper.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/snakebar_helper.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/Dashboard/dashboard.dart';
import 'package:http/http.dart' as http;

class ReferAChemistController extends GetxController {
  final fName = TextEditingController();
  final mobile = TextEditingController();
  final email = TextEditingController();

  GlobalKey<FormState> referFormKey = GlobalKey<FormState>();

  final box = GetStorage();

  void sendReferralPharmacy() async {
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${box.read('accessToken')}',
    };

    await http.post(Uri.parse(ApiHelper.referralPharmacyUrls),
        headers: headers,
        body: {
          'name': fName.text,
          'mobile_no': mobile.text,
          'email_id': email.text,
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
