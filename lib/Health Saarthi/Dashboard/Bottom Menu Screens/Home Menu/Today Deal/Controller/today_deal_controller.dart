import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Device%20Information/device_information.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Model%20Helper/Dashboard%20Model/today_deal_details_model.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Netwok%20Helper/api_url_helper.dart';
import 'package:http/http.dart' as http;

import '../../../../../App Helper/app_text_helper.dart';
import '../../../../../App Helper/snakebar_helper.dart';

class TodayDealController extends GetxController {
  int? dealId;
  TodayDealController({this.dealId});
  RxInt currentIndex = 0.obs;

  @override
  void onInit() {
    fetchTodayDealDetails(1);
    super.onInit();
  }

  Rx<TodayDealDetailsModel> todayDealModel = TodayDealDetailsModel().obs;
  RxBool dealLoading = false.obs;
  Future<void> fetchTodayDealDetails(index) async {
    dealLoading(true);
    Map dealData = {
      'id': dealId.toString(),
    };
    final box = GetStorage();
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${box.read('accessToken')}',
    };
    final response = await http.post(
        Uri.parse("${ApiHelper.todayDealDetailsUrls}?page=$index"),
        body: dealData,
        headers: headers);

    final responseData = json.decode(response.body);
    log("response -> $responseData");

    final bodyStatus = responseData['status'];

    log('${dealId}');
    if (response.statusCode == 200) {
      if (bodyStatus == 200) {
        todayDealModel.value = TodayDealDetailsModel.fromJson(responseData);
        dealLoading(false);
      } else if (bodyStatus == '402') {
        var msg = responseData['message'];
        DeviceInformation.logoutUser();
        SnackBarHelper.getWarningMsg('$msg');
        dealLoading(false);
      } else {
        SnackBarHelper.getWarningMsg(AppTextHelper.serverError);
        dealLoading(false);
      }
    } else {
      log('something went wrong status code :-< ${response.statusCode}');
      dealLoading(false);
    }
  }
}
