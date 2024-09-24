import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Netwok%20Helper/api_url_helper.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/snakebar_helper.dart';
import 'package:http/http.dart' as http;

import '../../Model Helper/Cart Menu/mobile_number_model.dart';
import '../../Model Helper/Cart Menu/patient_model.dart';
import 'cart_response_model.dart';

class CartDataHelper {
  static Future<CartResponseModel> addToCartTest(testId) async {
    var count, amount;
    final box = GetStorage();
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${box.read('accessToken')}',
    };
    try {
      final response = await http.post(
        Uri.parse(ApiHelper.addItemsUrls),
        headers: headers,
        body: {
          'test_managements_id': testId.toString(),
        },
      );

      final responseData = json.decode(response.body);
      var bodyStatus = responseData['status'];
      var bodyMsg = responseData['message'];

      if (bodyStatus == 200) {
        count = responseData['data']['count'];
        amount = responseData['data']['amount'];
        SnackBarHelper.getSuccessMsg('$bodyMsg');
      } else if (bodyMsg == 400) {
        SnackBarHelper.getWarningMsg('$bodyMsg');
      } else {
        SnackBarHelper.getWarningMsg('$bodyMsg');
      }
      return CartResponseModel(bodyStatus, bodyMsg, count, amount);
    } catch (error) {
      log(error.toString());
      SnackBarHelper.getWarningMsg('Please try again');
      return CartResponseModel(500, 'Something went wrong', 0, '0.00');
    }
  }

  static Future<CartResponseModel> removeToCartTest(testId) async {
    final box = GetStorage();
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${box.read('accessToken')}',
    };
    try {
      final response = await http.post(Uri.parse(ApiHelper.removeItemsUrls),
          headers: headers, body: {'test_managements_id': testId.toString()});
      final responseData = json.decode(response.body);
      var bodyStatus = responseData['status'];
      var bodyMsg = responseData['message'];
      var count = responseData['data']['count'];
      var amount = responseData['data']['amount'];
      if (bodyStatus == 200) {
        Get.closeAllSnackbars();
        Get.back();
        SnackBarHelper.getSuccessMsg('$bodyMsg');
        log('$bodyMsg');
      } else {
        Get.back();
        SnackBarHelper.getWarningMsg('$bodyMsg');
      }
      return CartResponseModel(bodyStatus, bodyMsg, count, amount);
    } catch (error) {
      log(error.toString());
      Get.back();
      SnackBarHelper.getWarningMsg('Please try again');
      return CartResponseModel(500, 'Something went wrong', 0, '0.00');
    }
  }

  static Future<List<MobileData>> getMobileNumber(mobileNumber) async {
    final box = GetStorage();
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${box.read('accessToken')}',
    };
    try {
      final response = await http.post(
          Uri.parse(ApiHelper.mobileNumberListUrls),
          headers: headers,
          body: {
            'mobile_no': mobileNumber?.toString() ?? '',
          });

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        MobileNumberModel mobileNumberModel = MobileNumberModel.fromJson(data);
        List<MobileData>? mobileNumberList = mobileNumberModel.mobileData;
        return mobileNumberList ?? [];
      } else {
        throw Exception('Failed to fetch state list');
      }
    } catch (e) {
      log("Error -> $e");
      throw Exception('Failed to fetch state list');
    }
  }

  static Future<PatientModel> fetchPatientProfile(patientId) async {
    final box = GetStorage();
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${box.read('accessToken')}',
    };
    var response = await http
        .post(Uri.parse(ApiHelper.patientProfileUrls), headers: headers, body: {
      'enc_pharmacy_patient_id': patientId.toString(),
    });
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      return PatientModel.fromJson(jsonResponse);
    } else {
      throw Exception('Request failed with status: ${response.statusCode}.');
    }
  }
}
