import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Device%20Information/device_information.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Model%20Helper/Drawer%20Menu/booking_history_model.dart';
import 'package:http/http.dart';
import '../../../../App Helper/Netwok Helper/api_url_helper.dart';

class MyBookingHistoryController extends GetxController {
  final fromDate = TextEditingController();
  final toDate = TextEditingController();

  @override
  void onInit() {
    fetchBookingHistory();
    super.onInit();
  }

  Rx<BookingHistoryModel> bookingHistoryModel = BookingHistoryModel().obs;
  RxBool isLoading = false.obs;
  Future<void> fetchBookingHistory() async {
    isLoading(true);
    final box = GetStorage();
    Map body = {
      'from_date': fromDate.text,
      'to_date': toDate.text,
    };
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${box.read('accessToken')}',
    };
    final response = await post(Uri.parse(ApiHelper.bookingHistoryUrls),
        headers: headers, body: body);

    var responseBody = jsonDecode(response.body);
    if (response.statusCode == 200) {
      if (responseBody['status'] == 200) {
        bookingHistoryModel.value = BookingHistoryModel.fromJson(responseBody);
        isLoading(false);
      } else if (responseBody['status'] == '402') {
        DeviceInformation.logoutUser();
        isLoading(false);
      } else {
        log('something went wrong ${responseBody['message']}');
        isLoading(false);
      }
    } else {
      log('someting went wrong :-< status ${response.statusCode}');
      isLoading(false);
    }
  }
}
