import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Device%20Information/device_information.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Model%20Helper/Cart%20Menu/cart_model.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Netwok%20Helper/api_url_helper.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Widget%20Helper/Common%20Location%20Picker/common_lication_picker_controller.dart';
import 'package:http/http.dart' as http;

import '../../../../App Helper/Model Helper/Cart Menu/cart_calculation.dart';
import '../../../../App Helper/Netwok Helper/Profile Call/profile_call.dart';

class TestCartController extends GetxController {
  final locationController = Get.find<CommonLocationPickerController>();
  String? accessToken;
  final box = GetStorage();
  @override
  void onInit() {
    accessToken = box.read('accessToken');
    getUserStatus();
    fetchCart(sBranchId.value);
    cartCalculation();
    super.onInit();
  }

  @override
  void onClose() {
    locationController.selectedState.value = '';
    locationController.selectedStateId.value = '';
    locationController.selectedCity.value = '';
    locationController.selectedCityId.value = '';
    locationController.selectedArea.value = '';
    locationController.selectedAreaId.value = '';
    locationController.selectedBranch.value = '';
    locationController.selectedBranchId.value = '';
    super.onClose();
  }

  final testScrollController = ScrollController();
  final profileScrollController = ScrollController();
  final packageScrollController = ScrollController();

  RxString selectLocation = ''.obs;

  RxString sStateName = ''.obs;
  RxString sCityName = ''.obs;
  RxString sAreaName = ''.obs;
  RxString sBranchName = ''.obs;
  RxString sStateId = ''.obs;
  RxString sCityId = ''.obs;
  RxString sAreaId = ''.obs;
  RxString sBranchId = ''.obs;

  RxBool setLocation = false.obs;
  RxBool showDLocation = false.obs;
  RxBool showExpantile = false.obs;

  final promoApply = TextEditingController();
  GlobalKey<FormState> locationFormKey = GlobalKey<FormState>();
  var grossAmount = ''.obs;
  var totalAmount = ''.obs;
  var netAmount = ''.obs;
  RxBool callPromo = false.obs;
  var isApplyPromo;
  var applyPromo;
  RxString testD = ''.obs;
  RxString packageD = ''.obs;
  RxString profileD = ''.obs;

  var userStatus;
  getUserStatus() async {
    try {
      dynamic userData = await ProfileFuture().fetchProfile();
      userStatus = userData.data.status;
      sStateId.value = userData.data.state.id.toString();
      sCityId.value = userData.data.city.id.toString();
      sAreaId.value = userData.data.area.id.toString();
      sBranchId.value = userData.data.costCenter.id.toString();
      sStateName.value = userData.data.state.stateName.toString();
      sCityName.value = userData.data.city.cityName.toString();
      sAreaName.value = userData.data.area.areaName.toString();
      sBranchName.value = userData.data.costCenter.branchName.toString();
      // pageLoad = true;
    } catch (e) {
      log("get User Status Error->$e");
      if (e.toString().contains('402')) {
        DeviceInformation.logoutUser();
      }
      // setState(() {
      //   pageLoad = true;
      // });
    }
  }

  Rx<CartModel> cartModel = CartModel().obs;
  RxBool cartLoading = false.obs;
  Future<void> fetchCart(data) async {
    cartLoading(true);
    try {
      Map sendData = {'cost_center_id': data.toString()};
      final box = GetStorage();
      final response = await http.post(Uri.parse(ApiHelper.cartItemsUrls),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ${box.read('accessToken')}',
          },
          body: sendData);
      var responseBody = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (responseBody['status'] == 200) {
          cartModel.value = CartModel.fromJson(responseBody);
          log('cart model response ==>> ${cartModel.value.data?.globalSettingTestSlot}');
          cartLoading(false);
        } else {
          log('error in fetch cart :-< ${responseBody['message']}');
          cartLoading(false);
        }
      }
    } catch (e) {
      log('something went wrong in fetching ');
      cartLoading(false);
    }
  }

  var bodyMsg;
  RxBool cartCalculationLoading = false.obs;
  Future<CartCalculationModel?> cartCalculation() async {
    cartCalculationLoading(true);
    log('cart cal promo--->>${promoApply.text}');
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $accessToken',
    };
    try {
      final response = await http.post(Uri.parse(ApiHelper.cartCalculationUrls),
          headers: headers,
          body: {
            'test_discount_id': testD.value.toString(),
            'package_discount_id': packageD.value.toString(),
            'profile_discount_id': profileD.value.toString(),
            'promo_offer_code': promoApply.text
          });
      final responseData = json.decode(response.body);
      log("--------->>>>responsedata->$responseData");
      var bodyStatus = responseData['status'];
      bodyMsg = responseData['message'];
      if (response.statusCode == 200) {
        if (bodyStatus == 200) {
          isApplyPromo = responseData['data']['isApplyPromo'];
          applyPromo = responseData['data']['applyPromo'];
          netAmount.value = responseData['data']['netAmount'].toString();
          grossAmount.value = responseData['data']['grossAmount'].toString();
          totalAmount.value = responseData['data']['discountAmount'].toString();
          cartCalculationLoading(false);
        } else if (bodyStatus == 400) {
          isApplyPromo = responseData['data']['isApplyPromo'];
          applyPromo = responseData['data']['applyPromo'];
          netAmount.value = responseData['data']['netAmount'].toString();
          grossAmount.value = responseData['data']['grossAmount'].toString();
          totalAmount.value = responseData['data']['discountAmount'].toString();
          promoApply.text = '';
          cartCalculationLoading(false);
        } else if (bodyStatus == '402') {
          DeviceInformation.logoutUser();
          cartCalculationLoading(false);
        }
      } else if (response.statusCode == 400) {
        if (bodyStatus == 400) {
          isApplyPromo = responseData['data']['isApplyPromo'];
          applyPromo = responseData['data']['applyPromo'];
          netAmount.value = responseData['data']['netAmount'].toString();
          grossAmount.value = responseData['data']['grossAmount'].toString();
          totalAmount.value = responseData['data']['discountAmount'].toString();
          promoApply.text = '';
          cartCalculationLoading(false);
        }
      }
    } catch (error) {
      log("cart Calculation Error->$error");
      cartCalculationLoading(false);
    }
    return null;
  }
}
