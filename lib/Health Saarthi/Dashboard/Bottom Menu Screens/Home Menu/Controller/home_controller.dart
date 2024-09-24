import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Model%20Helper/Dashboard%20Model/banner_model.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Model%20Helper/Dashboard%20Model/today_deal_model.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Token%20Helper/authentication_manager.dart';
import 'package:http/http.dart' as http;

import '../../../../App Helper/Device Information/device_information.dart';
import '../../../../App Helper/Netwok Helper/api_url_helper.dart';
import '../../../../App Helper/Widget Helper/Common Location Picker/common_lication_picker_controller.dart';

class HomeController extends GetxController {
  String? accessToken;
  final locationController =
      Get.put(CommonLocationPickerController(), permanent: true);
  @override
  void onInit() {
    accessToken = AuthenticationManager.getToken();
    fetchBanner();
    fetchTodayDeal();
    fetchPopularPackages();
    super.onInit();
  }

  Rx<BannerModel> bannerModel = BannerModel().obs;
  RxBool bannerLoading = false.obs;
  Future fetchBanner() async {
    bannerLoading(true);
    try {
      log('access toke :--> $accessToken');
      final response = await http.post(
        Uri.parse(ApiHelper.bannerUrls),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
      );
      var responseBody = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (responseBody['status'] == 200) {
          bannerModel.value = BannerModel.fromJson(responseBody);
          log('banner data :=> ${bannerModel.value.data}');
          bannerLoading(false);
        } else if (responseBody['status'] == '402') {
          bannerLoading(false);
          DeviceInformation.logoutUser();
        }
      } else {
        log('error in banners');
        log('${response.statusCode}');
        log(response.body);
        bannerLoading(false);
      }
    } catch (e) {
      log('something went wrong in fetching banner $e');
      bannerLoading(false);
    }
  }

  Rx<TodayDealModel> todayDealModel = TodayDealModel().obs;
  RxBool todaysDealLoading = false.obs;
  Future fetchTodayDeal() async {
    todaysDealLoading(true);
    try {
      final response = await http.post(
        Uri.parse(ApiHelper.todayDealUrls),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
      );
      var responseBody = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (responseBody['status'] == 200) {
          todayDealModel.value = TodayDealModel.fromJson(responseBody);
          log('today\'s deal data :=> ${todayDealModel.value.todayData}');
          todaysDealLoading(false);
        } else if (responseBody['status'] == '402') {
          bannerLoading(false);
          DeviceInformation.logoutUser();
        }
      } else {
        log('error in today\'s deal ');
        log('${response.statusCode}');
        log(response.body);
        todaysDealLoading(false);
      }
    } catch (e) {
      log('something went wrong in fetching today\'s deals $e');
      todaysDealLoading(false);
    }
  }

  List popularPackageData = [];
  RxBool popularPackageLoading = false.obs;
  Future fetchPopularPackages() async {
    popularPackageLoading(true);
    try {
      final response =
          await http.get(Uri.parse(ApiHelper.popularPackage), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $accessToken',
      });
      var responseBody = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (responseBody['status'] == 200) {
          popularPackageData = responseBody['data'];
          popularPackageLoading(false);
        } else if (responseBody['status'] == '402') {
          bannerLoading(false);
          DeviceInformation.logoutUser();
        }
      } else {
        log('error in popular packages');
        log('${response.statusCode}');
        log(response.body);
        popularPackageLoading(false);
      }
    } catch (e) {
      log('something went wrong in popular packages $e');
      popularPackageLoading(false);
    }
  }
}
