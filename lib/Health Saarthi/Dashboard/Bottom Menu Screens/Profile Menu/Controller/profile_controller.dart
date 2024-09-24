import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/snakebar_helper.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/Dashboard/dashboard.dart';
import 'package:http/http.dart' as http;

import '../../../../App Helper/Device Information/device_information.dart';
import '../../../../App Helper/Model Helper/Dashboard Model/profile_model.dart';
import '../../../../App Helper/Netwok Helper/api_url_helper.dart';
import '../../../../App Helper/Token Helper/authentication_manager.dart';
import '../../../../App Helper/app_text_helper.dart';

class ProfileController extends GetxController {
  final box = GetStorage();

  final firstNm = TextEditingController();
  final mobile = TextEditingController();
  final email = TextEditingController();
  final address = TextEditingController();
  final state = TextEditingController();
  final city = TextEditingController();
  final area = TextEditingController();
  final branch = TextEditingController();

  final bankNm = TextEditingController();
  final ifscCode = TextEditingController();
  final accountNo = TextEditingController();
  var pincode = TextEditingController();
  var gstNo = TextEditingController();

  String? panCard;
  String? addressProfe;
  String? aadharCardF;
  String? aadharCardB;
  String? chequeFile;
  String? gstFile;
  String? panCardImg;
  String? addressProfeImg;
  String? aadharCardFImg;
  String? aadharCardBImg;
  String? chequeImg;
  String? gstImg;

  Rxn<int> userStatus = Rxn<int>();
  Rxn<File> panCardChange = Rxn<File>();
  Rxn<File> aadhaarCardFChange = Rxn<File>();
  Rxn<File> aadhaarCardBChange = Rxn<File>();
  Rxn<File> addressChange = Rxn<File>();
  Rxn<File> chequeChange = Rxn<File>();
  Rxn<File> gstFileChange = Rxn<File>();

  @override
  void onInit() {
    getUserStatus();
    firstNm.text = box.read('name');
    mobile.text = box.read('mobile');
    email.text = box.read('email');
    address.text = box.read('address');
    state.text = box.read('stateNm');
    city.text = box.read('cityNm');
    area.text = box.read('areaNm');
    branch.text = box.read('branchNm');
    pincode.text = box.read('pincode');
    gstNo.text = box.read('gstNo');
    bankNm.text = box.read('bankNm');
    ifscCode.text = box.read('ifsc');
    accountNo.text = box.read('accountNo');
    panCard = box.read('pancard');
    panCardImg = box.read('pancardImg');
    aadharCardF = box.read('aadhaarF');
    aadharCardFImg = box.read('aadhaarFImg');
    aadharCardB = box.read('aadhaarB');
    aadharCardBImg = box.read('aadhaarBImg');
    addressProfe = box.read('addressProof');
    addressProfeImg = box.read('addressImg');
    chequeFile = box.read('chequeImage');
    chequeImg = box.read('chequeImg');
    gstFile = box.read('gstImage');
    gstImg = box.read('gstImg');
    update();
    super.onInit();
  }

  ProfileModel? profileModel;
  Future<void> getUserStatus() async {
    try {
      String? token = AuthenticationManager.getToken();
      final response = await http.get(Uri.parse(ApiHelper.profileUrls),
          headers: {'Authorization': 'Bearer $token'});

      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        if (responseBody['status'] == 200) {
          profileModel = ProfileModel.fromJson(responseBody);

          if (profileModel != null && profileModel?.data != null) {
            userStatus.value = profileModel!.data!.status!;
            log(userStatus.toString());
          }
        } else if (responseBody['status'] == 402) {
          DeviceInformation.logoutUser();
        } else {
          log('something went wrong in server side ${responseBody['status']}');
        }
      } else {
        log('something went wrong statuscode :-< ${response.statusCode}');
      }
    } on SocketException {
      log('socket exception ');
    } catch (e) {
      log("get User Status Error->$e");
    }
  }

  void updateProfileData() async {
    Dio dio = Dio();
    String apiUrl = ApiHelper.updateProfileUrls;
    Get.dialog(
        const Dialog(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(width: 16),
                Text('Loading...'),
              ],
            ),
          ),
        ),
        barrierDismissible: false);
    try {
      FormData formData = FormData();
      if (panCardChange.value != null) {
        formData.files.add(MapEntry('pancard',
            await MultipartFile.fromFile(panCardChange.value!.path)));
      }
      if (addressChange.value != null) {
        formData.files.add(MapEntry('address_proof',
            await MultipartFile.fromFile(addressChange.value!.path)));
      }
      if (aadhaarCardFChange.value != null) {
        formData.files.add(MapEntry('aadhar_front',
            await MultipartFile.fromFile(aadhaarCardFChange.value!.path)));
      }
      if (aadhaarCardBChange.value != null) {
        formData.files.add(MapEntry('aadhar_back',
            await MultipartFile.fromFile(aadhaarCardBChange.value!.path)));
      }
      if (chequeChange.value != null) {
        formData.files.add(MapEntry('cheque_image',
            await MultipartFile.fromFile(chequeChange.value!.path)));
      }
      if (gstFileChange.value != null) {
        formData.files.add(MapEntry('gst_image',
            await MultipartFile.fromFile(gstFileChange.value!.path)));
      }
      var response = await dio.post(
        apiUrl,
        data: formData,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ${box.read('accessToken')}',
          },
        ),
      );
      print(response.data);
      print('========================<<<>>>>>${response.statusCode}');
      if (response.statusCode == 200) {
        var data = response.data;
        var msg = data['message'];
        print('========================<<<>>>>>${data['status']}');
        if (data['status'] == 200) {
          SnackBarHelper.getSuccessMsg('$msg');
          Get.offAll(() => const Dashboard());
        }
      } else if (response.statusCode == 400) {
        var data = response.data;
        var errorMsg = data['message'];
        if (data['status'] == 400) {
          Get.back();
          SnackBarHelper.getWarningMsg('$errorMsg');
        }
      }
    } catch (e) {
      print("Error uploading documents: $e");
      Get.back();
      SnackBarHelper.getWarningMsg(AppTextHelper.selectDocuments);
    }
  }
}
