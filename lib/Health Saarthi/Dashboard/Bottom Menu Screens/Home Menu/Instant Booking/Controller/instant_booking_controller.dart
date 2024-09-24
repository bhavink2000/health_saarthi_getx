import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Device%20Information/device_information.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Netwok%20Helper/Cart%20Data%20Helper/cart_data_helper.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Netwok%20Helper/api_url_helper.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../../../../../App Helper/Model Helper/Cart Menu/mobile_number_model.dart';
import '../../../../../App Helper/Thank You Page/thank_you_page.dart';
import '../../../../../App Helper/Widget Helper/Common Location Picker/common_lication_picker_controller.dart';
import '../../../../../App Helper/app_text_helper.dart';
import '../../../../../App Helper/snakebar_helper.dart';

class InstantBookingController extends GetxController {
  final locationController = Get.find<CommonLocationPickerController>();

  final emailId = TextEditingController();
  final address = TextEditingController();
  final pinCode = TextEditingController();
  final collectionDate = TextEditingController();
  final remark = TextEditingController();

  RxString selectedGender = ''.obs;
  final pAge = TextEditingController();
  final pDob = TextEditingController();
  final pName = TextEditingController();
  final pMobile = TextEditingController();
  GlobalKey<FormState> instantBookingFormKey = GlobalKey<FormState>();

  RxBool isTyping = false.obs;

  Rxn<int> userStatus = Rxn<int>();

  @override
  void onInit() {
    DeviceInformation.getUserStatus().then((value) => userStatus.value = value);
    collectionDate.text = DateFormat('yyyy-MM-dd').format(DateTime.now());
    fetchMobileList();
    locationController.fetchState();
    super.onInit();
  }

  @override
  void onClose() {
    selectedMobileNumber.value = '';
    selectedGender.value = '';
    remark.text = '';
    pName.text = '';
    emailId.text = '';
    pMobile.text = '';
    pDob.text = '';
    pAge.text = '';
    pinCode.text = '';
    address.text = '';
    locationController.selectedState.value = '';
    locationController.selectedStateId.value = '';
    locationController.selectedCity.value = '';
    locationController.selectedCityId.value = '';
    locationController.selectedArea.value = '';
    locationController.selectedAreaId.value = '';
    locationController.selectedBranch.value = '';
    locationController.selectedBranchId.value = '';
    locationController.stateList.clear();
    locationController.cityList.clear();
    locationController.areaList.clear();
    locationController.branchList.clear();
    super.onClose();
  }

  // List<MobileData> mobileList = [];
  List<MobileData> mobileList = [];
  RxString selectedMobileNumber = ''.obs;
  Future<void> fetchMobileList() async {
    List<MobileData> list =
        await CartDataHelper.getMobileNumber(selectedMobileNumber);
    mobileList = list;
  }

  var pharmacyId;
  void getPatient(var patientId) async {
    try {
      var pModel = await CartDataHelper.fetchPatientProfile(patientId);
      pharmacyId = pModel.patientData!.pharmacyId.toString();
      pName.text = pModel.patientData!.name ?? '';
      pDob.text = pModel.patientData!.dateOfBirth ?? '';
      pAge.text = pModel.patientData!.age ?? '';
      pMobile.text = pModel.patientData!.mobileNo ?? '';
      emailId.text = pModel.patientData!.emailId ?? '';
      address.text = pModel.patientData!.address ?? '';
      selectedGender.value = pModel.patientData!.gender.toString() == '1'
          ? 'Male'
          : pModel.patientData!.gender.toString() == '2'
              ? 'Female'
              : pModel.patientData!.gender.toString() == '3'
                  ? 'Other'
                  : '';
      pinCode.text = pModel.patientData!.pincode ?? '';

      locationController.selectedState.value =
          pModel.patientData!.state!.stateName.toString();
      locationController.selectedCity.value =
          pModel.patientData!.city!.cityName.toString();
      locationController.selectedArea.value =
          pModel.patientData!.area!.areaName.toString();

      locationController.selectedStateId.value =
          pModel.patientData!.state!.id.toString();
      locationController.selectedCityId.value =
          pModel.patientData!.city!.id.toString();
      locationController.selectedAreaId.value =
          pModel.patientData!.area!.id.toString();

      if (locationController.selectedStateId.value != '') {
        locationController
            .fetchCity(locationController.selectedStateId.value)
            .then((value) {
          locationController
              .fetchArea(locationController.selectedStateId.value,
                  locationController.selectedCityId.value)
              .then((value) {
            locationController.fetchBranch(
                locationController.selectedStateId.value,
                locationController.selectedCityId.value,
                locationController.selectedAreaId.value);
          });
        });
      }
    } catch (e) {
      log('Error: $e');
    }
  }

  RxBool instantBookingLoading = false.obs;
  Future<void> instantBooking() async {
    instantBookingLoading(true);
    final pGender = selectedGender.value == 'Male'
        ? 1
        : selectedGender.value == 'Female'
            ? 2
            : selectedGender.value == 'Other'
                ? 3
                : 0;
    final box = GetStorage();
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${box.read('accessToken')}',
    };

    final Map<String, dynamic> requestBody = {
      "pharmacy_patient_id": selectedMobileNumber.value,
      "collection_date": collectionDate.text,
      "remark": remark.text,
      "name": pName.text,
      "email_id": emailId.text,
      "mobile_no": pMobile.text,
      "gender": '$pGender',
      "age": pAge.text,
      "state_id": locationController.selectedStateId.value,
      'city_id': locationController.selectedCityId.value,
      'area_id': locationController.selectedAreaId.value,
      'cost_center_id': locationController.selectedBranchId.value,
      'address': address.text,
    };

    try {
      final response = await http.post(
        Uri.parse(ApiHelper.instantBookingUrls),
        headers: headers,
        body: requestBody,
      );

      final responseData = json.decode(response.body);
      log("response -> $responseData");

      final bodyStatus = responseData['status'];
      final bodyMsg = responseData['message'];

      if (bodyStatus == 200) {
        SnackBarHelper.getSuccessMsg('$bodyMsg');
        selectedMobileNumber.value = '';
        selectedGender.value = '';
        remark.text = '';
        pName.text = '';
        emailId.text = '';
        pMobile.text = '';
        pDob.text = '';
        pAge.text = '';
        pinCode.text = '';
        address.text = '';
        locationController.selectedState.value = '';
        locationController.selectedCity.value = '';
        locationController.selectedArea.value = '';
        locationController.selectedBranch.value = '';
        locationController.cityList.clear();
        locationController.areaList.clear();
        locationController.branchList.clear();
        instantBookingLoading(false);
        Get.off(() => const ThankYouPage());
      } else if (bodyStatus == 400) {
        final msg = responseData['error']['mobile_no'][0];
        SnackBarHelper.getWarningMsg('$msg');
        instantBookingLoading(false);
      } else if (response.statusCode == 500) {
        SnackBarHelper.getWarningMsg(AppTextHelper.internalServerError);
        instantBookingLoading(false);
      } else if (bodyStatus == '402') {
        var msg = responseData['message'];
        DeviceInformation.logoutUser();
        SnackBarHelper.getWarningMsg('$msg');
        instantBookingLoading(false);
      } else {
        SnackBarHelper.getWarningMsg(AppTextHelper.serverError);
        instantBookingLoading(false);
      }
    } catch (error) {
      log("Error: $error");
      SnackBarHelper.getWarningMsg(AppTextHelper.serverError);
      instantBookingLoading(false);
    }
  }
}
