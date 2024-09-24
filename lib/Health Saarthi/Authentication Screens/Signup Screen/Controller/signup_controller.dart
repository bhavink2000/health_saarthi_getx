import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Netwok%20Helper/api_url_helper.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Netwok%20Helper/get_location_helper.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/snakebar_helper.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/Authentication%20Screens/Login%20Screen/login_screen.dart';
import 'package:http/http.dart' as http;

import '../../../App Helper/Model Helper/Location Model/area_model.dart';
import '../../../App Helper/Model Helper/Location Model/branch_model.dart';
import '../../../App Helper/Model Helper/Location Model/city_model.dart';
import '../../../App Helper/Model Helper/Location Model/state_model.dart';
import '../../../App Helper/app_text_helper.dart';

class SignupController extends GetxController {
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  final vendorName = TextEditingController();
  final emailId = TextEditingController();
  final pharmacyName = TextEditingController();
  final mobile = TextEditingController();
  final pincode = TextEditingController();
  final address = TextEditingController();
  final panCardNo = TextEditingController();
  final gstNo = TextEditingController();
  final bankName = TextEditingController();
  final ifscCode = TextEditingController();
  final beneficiaryName = TextEditingController();
  final accountNo = TextEditingController();
  final password = TextEditingController();
  final cPassword = TextEditingController();
  final seMobile = TextEditingController();
  RxBool showExecutive = false.obs;
  var selectedSalesMobileNo;

  Rxn<File> aadhaarCardFFile = Rxn<File>();
  Rxn<File> aadhaarCardBFile = Rxn<File>();
  Rxn<File> addressFile = Rxn<File>();
  Rxn<File> panCardFile = Rxn<File>();
  Rxn<File> gstFile = Rxn<File>();
  Rxn<File> chequeFile = Rxn<File>();

  RxBool obScured = true.obs;
  togglePasswordView() => obScured.value = !obScured.value;

  RxBool obCScured = true.obs;
  toggleCPasswordView() => obCScured.value = !obCScured.value;

  RxBool agreedToTOS = false.obs;
  void setAgreedToTOS(bool? newValue) =>
      {agreedToTOS.value = newValue!, log('after selection $chequeFile')};

  @override
  void onInit() {
    getB2bSalesList();
    fetchState();
    super.onInit();
  }

  RxString selectedB2b = ''.obs;
  RxString selectedSales = ''.obs;
  RxList b2bSubAdminList = [].obs;
  RxList salesExecutiveList = [].obs;
  Future<void> getB2bSalesList() async {
    try {
      final response = await http.get(
        Uri.parse(ApiHelper.b2bSalesUrl),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        b2bSubAdminList.value = data['data']['b2b_subadmins'];
        salesExecutiveList.value = data['data']['sales_executive_admins'];
        log('$data');
      } else {}
    } catch (e) {
      log("B2b & Sales Error :-< $e");
    }
  }

  GetLocationHelper locationHelper = GetLocationHelper();
  List<StateData?> stateList = [];
  RxString selectedState = ''.obs;
  RxString selectedStateId = ''.obs;
  RxBool stateLoading = false.obs;
  Future<void> fetchState() async {
    stateLoading(true);
    try {
      stateList = await locationHelper.getState();
      stateLoading(false);
    } catch (e) {
      log('Error in state load :-< $e');
      stateLoading(false);
    }
  }

  void onChangedState(value) {
    final selectedStateObject = stateList.firstWhere(
      (state) => state!.stateName == value,
      orElse: () => StateData(),
    );
    if (selectedStateObject != null) {
      cityList.clear();
      selectedCity.value = '';
      areaList.clear();
      selectedArea.value = '';
      branchList.clear();
      selectedBranch.value = '';
      selectedState.value = value;
      selectedStateId.value = '${selectedStateObject.id}';

      log('in state function ${selectedStateObject.id}');
      log('in state function ${selectedStateObject.stateName}');
      fetchCity(selectedStateId.value);
    }
  }

  List<CityData?> cityList = [];
  RxString selectedCity = ''.obs;
  RxString selectedCityId = ''.obs;
  RxBool cityLoading = false.obs;
  Future<void> fetchCity(stateId) async {
    log('in city function $stateId');
    cityLoading(true);
    try {
      cityList = await locationHelper.getCity(stateId);
      cityLoading(false);
    } catch (e) {
      log('Error in city load :-< $e');
      cityLoading(false);
    }
  }

  void onChangedCity(value) {
    final selectedCityObject = cityList.firstWhere(
      (city) => city!.cityName == value,
      orElse: () => CityData(), // Return an empty instance of StateData
    );
    if (selectedCityObject != null) {
      selectedCity.value = '';
      areaList.clear();
      selectedArea.value = '';
      branchList.clear();
      selectedBranch.value = '';
      selectedCity.value = value;
      selectedCityId.value = selectedCityObject.id.toString();
      fetchBranch(selectedStateId, selectedCityId, '');
      fetchArea(selectedStateId, selectedCityId);
    }
  }

  List<AreaData?> areaList = [];
  RxString selectedArea = ''.obs;
  RxString selectedAreaId = ''.obs;
  RxBool areaLoading = false.obs;
  Future<void> fetchArea(stateId, cityId) async {
    areaLoading(true);
    try {
      areaList = await locationHelper.getArea(stateId, cityId);
      areaLoading(false);
    } catch (e) {
      log('Error in area load :-< $e');
      areaLoading(false);
    }
  }

  void onChangedArea(value) {
    final selectedAreaObject = areaList.firstWhere(
      (area) => area!.areaName == value,
      orElse: () => AreaData(), // Return an empty instance of StateData
    );
    if (selectedAreaObject != null) {
      // branchList.clear();
      // selectedBranch.value = '';
      selectedArea.value = value;
      selectedAreaId.value = selectedAreaObject.id.toString();
    }
  }

  List<BranchData?> branchList = [];
  RxString selectedBranch = ''.obs;
  RxString selectedBranchId = ''.obs;
  RxBool branchLoading = false.obs;
  Future<void> fetchBranch(stateId, cityId, areaId) async {
    branchLoading(true);
    try {
      branchList = await locationHelper.getBranch(stateId, cityId, areaId);
      branchLoading(false);
    } catch (e) {
      log('Error in branch load :-< $e');
      branchLoading(false);
    }
  }

  void onChangedBranch(value) {
    final selectedBranchObject = branchList.firstWhere(
      (branch) => branch!.branchName == value,
      orElse: () => BranchData(), // Return an empty instance of StateData
    );
    if (selectedBranchObject != null) {
      selectedBranch.value = value;
      selectedBranchId.value = selectedBranchObject.id.toString();
    }
  }

  Future<void> storeStateCityAreaBranch() async {
    final box = GetStorage();
    await box.write('signupStateId', selectedStateId);
    await box.write('signupCityId', selectedCityId);
    await box.write('signupAreaId', selectedAreaId);
    await box.write('signupBranchId', selectedBranchId);
    await box.write('signupStateName', selectedState);
    await box.write('signupCityName', selectedCity);
    await box.write('signupAreaName', selectedArea);
    await box.write('signupBranchName', selectedBranch);
  }

  RxDouble loadingProgress = 0.0.obs;
  RxBool isSigningUp = false.obs;
  signUpData() async {
    isSigningUp.value = true;
    final dio = Dio();
    var url = ApiHelper.signUpUrl;
    try {
      var formData = FormData();
      formData.fields.addAll([
        MapEntry("vendor_name", vendorName.text),
        MapEntry("email_id", emailId.text),
        MapEntry("password", password.text),
        MapEntry("mobile", mobile.text),
        MapEntry("name", pharmacyName.text), // name = pharmacy name
        MapEntry("state_id", selectedStateId.value),
        MapEntry("city_id", selectedCityId.value),
        MapEntry("area_id", selectedAreaId.value),
        MapEntry("cost_center_id", selectedBranchId.value),
        MapEntry("address", address.text),
        MapEntry("pincode", pincode.text),
        MapEntry("pancard_number", panCardNo.text),
        MapEntry("sales_executive_admin_id", selectedSales.value),
        MapEntry("b2b_subadmin_id", selectedB2b.value),
        MapEntry("bank_name", bankName.text),
        MapEntry("ifsc", ifscCode.text),
        MapEntry("beneficiary_name", beneficiaryName.text),
        MapEntry("account_number", accountNo.text),
        MapEntry("gst_number", gstNo.text),
      ]);
      if (panCardFile.value != null) {
        formData.files.add(MapEntry(
          "pancard",
          await MultipartFile.fromFile(
            panCardFile.value!.path,
            filename: panCardFile.value!.path.split('/').last.toString(),
          ),
        ));
      }
      if (addressFile.value != null) {
        formData.files.add(MapEntry(
          "address_proof",
          await MultipartFile.fromFile(
            addressFile.value!.path,
            filename: addressFile.value!.path.split('/').last.toString(),
          ),
        ));
      }
      if (aadhaarCardFFile.value != null) {
        formData.files.add(MapEntry(
          "aadhar_front",
          await MultipartFile.fromFile(
            aadhaarCardFFile.value!.path,
            filename: aadhaarCardFFile.value!.path.split('/').last.toString(),
          ),
        ));
      }
      if (aadhaarCardBFile.value != null) {
        formData.files.add(MapEntry(
          "aadhar_back",
          await MultipartFile.fromFile(
            aadhaarCardBFile.value!.path,
            filename: aadhaarCardBFile.value!.path.split('/').last.toString(),
          ),
        ));
      }
      if (chequeFile.value != null) {
        formData.files.add(MapEntry(
          "cheque_image",
          await MultipartFile.fromFile(
            chequeFile.value!.path,
            filename: chequeFile.value!.path.split('/').last.toString(),
          ),
        ));
      }
      if (gstFile.value != null) {
        formData.files.add(MapEntry(
          "gst_image",
          await MultipartFile.fromFile(
            gstFile.value!.path,
            filename: gstFile.value!.path.split('/').last.toString(),
          ),
        ));
      }

      dio.interceptors.add(InterceptorsWrapper(
          onError: (DioError err, ErrorInterceptorHandler handler) async {
        log("in dio interceptor->${err.response}");
        if (err.response != null) {
          var responseData = err.response!.data;
          if (responseData['status'] == 400) {
            var errorData = responseData['error'];
            if (errorData['email_id'] != null) {
              var errorMessage = errorData['email_id'][0];
              loadingProgress.value = 0.0;
              isSigningUp.value = false;

              SnackBarHelper.getWarningMsg('$errorMessage');
            } else if (errorData['name'] != null) {
              var errorMessage = errorData['name'][0];
              loadingProgress.value = 0.0;
              isSigningUp.value = false;

              SnackBarHelper.getWarningMsg('$errorMessage');
            } else if (errorData['vendor_name'] != null) {
              var errorMessage = errorData['vendor_name'][0];
              loadingProgress.value = 0.0;
              isSigningUp.value = false;

              SnackBarHelper.getWarningMsg('$errorMessage');
            } else if (errorData['mobile'] != null) {
              var errorMessage = errorData['mobile'][0];
              loadingProgress.value = 0.0;
              isSigningUp.value = false;

              SnackBarHelper.getWarningMsg('$errorMessage');
            } else if (errorData['pincode'] != null) {
              var errorMessage = errorData['pincode'][0];
              loadingProgress.value = 0.0;
              isSigningUp.value = false;

              SnackBarHelper.getWarningMsg('$errorMessage');
            } else if (errorData['name'] != null) {
              var errorMessage = errorData['name'][0];
              loadingProgress.value = 0.0;
              isSigningUp.value = false;

              SnackBarHelper.getWarningMsg('$errorMessage');
            } else if (errorData['password'] != null) {
              var errorMessage = errorData['password'][0];
              loadingProgress.value = 0.0;
              isSigningUp.value = false;

              SnackBarHelper.getWarningMsg('$errorMessage');
            } else {
              loadingProgress.value = 0.0;
              isSigningUp.value = false;
            }
          } else {
            loadingProgress.value = 0.0;
            isSigningUp.value = false;
          }
        } else {
          loadingProgress.value = 0.0;
          isSigningUp.value = false;
        }
      }));
      final response = await dio.post(
        url,
        data: formData,
        options: Options(headers: {"Content-Type": "application/json"}),
        onSendProgress: (int sent, int total) {
          log('progress percentage: ${(sent / total * 100).toStringAsFixed(0)}% ($sent/$total)');
          double progress = (sent / total) * 100;
          loadingProgress.value = progress;
        },
      );
      final jsonData = response.data;
      if (response.statusCode == 200) {
        var bodyMSG = jsonData['message'];
        SnackBarHelper.getSuccessMsg('$bodyMSG');
        storeStateCityAreaBranch();

        Get.offAll(() => LoginScreen());

        loadingProgress.value = 0.0;
        isSigningUp(false);
      } else if (response.statusCode == 400) {
        var errorData = jsonData;
        if (errorData['error']['email_id'] != null) {
          var errorMessage = errorData['error']['email_id'][0];
          SnackBarHelper.getWarningMsg('$errorMessage');
        } else if (errorData['error']['name'] != null) {
          var errorMessage = errorData['error']['name'][0];
          SnackBarHelper.getWarningMsg('$errorMessage');
        } else if (errorData['error']['password'] != null) {
          var errorMessage = errorData['error']['password'][0];
          SnackBarHelper.getWarningMsg('$errorMessage');
        } else {
          SnackBarHelper.getWarningMsg(AppTextHelper.serverError);
          Get.back();
        }
        Get.back();
      } else {
        SnackBarHelper.getWarningMsg(AppTextHelper.internalServerError);
        Get.back();
      }
    } catch (e) {
      log('Error -> ${e.toString()}');
      SnackBarHelper.getWarningMsg(AppTextHelper.internalServerError);
      Get.back();
    }
  }
}
