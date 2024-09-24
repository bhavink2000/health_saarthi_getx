import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Device%20Information/device_information.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Token%20Helper/authentication_manager.dart';
import 'package:http/http.dart' as http;

import '../../App Helper/Model Helper/Dashboard Model/profile_model.dart';
import '../../App Helper/Netwok Helper/api_url_helper.dart';

class DashboardController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final box = GetStorage();

  @override
  void onInit() {
    getUserStatus();
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
            // userStatus = profileModel.data?.status;
            box.write('userStatus', profileModel?.data?.status);
            box.write('vendorNm',
                profileModel?.data?.vendorName?.toString() ?? 'N/A');
            box.write('name', profileModel?.data?.name?.toString() ?? 'N/A');
            box.write(
                'mobile', profileModel?.data?.mobile?.toString() ?? 'N/A');
            box.write(
                'email', profileModel?.data?.emailId?.toString() ?? 'N/A');
            box.write(
                'address', profileModel?.data?.address?.toString() ?? 'N/A');
            box.write('stateNm',
                profileModel?.data?.state?.stateName?.toString() ?? 'N/A');
            box.write('cityNm',
                profileModel?.data?.city?.cityName?.toString() ?? 'N/A');
            box.write('areaNm',
                profileModel?.data?.area?.areaName?.toString() ?? 'N/A');
            box.write(
                'branchNm',
                profileModel?.data?.costCenter?.branchName?.toString() ??
                    'N/A');
            box.write(
                'pincode', profileModel?.data?.pincode?.toString() ?? 'N/A');
            box.write(
                'bankNm', profileModel?.data?.bankName?.toString() ?? 'N/A');
            box.write('ifsc', profileModel?.data?.ifsc?.toString() ?? 'N/A');
            box.write('accountNo',
                profileModel?.data?.accountNumber?.toString() ?? 'N/A');
            box.write(
                'gstNo', profileModel?.data?.gstNumber?.toString() ?? 'N/A');
            box.write(
                'pancard', profileModel?.data?.pancard?.toString() ?? 'N/A');
            box.write('addressProof',
                profileModel?.data?.addressProof?.toString() ?? 'N/A');
            box.write('aadhaarF',
                profileModel?.data?.aadharFront?.toString() ?? 'N/A');
            box.write('aadhaarB',
                profileModel?.data?.aadharBack?.toString() ?? 'N/A');
            box.write('chequeImage',
                profileModel?.data?.chequeImage?.toString() ?? 'N/A');
            box.write(
                'gstImage', profileModel?.data?.gstImage?.toString() ?? 'N/A');
            box.write('pancardImg',
                profileModel?.data?.pancardImg?.toString() ?? 'N/A');
            box.write('addressImg',
                profileModel?.data?.addressProofImg?.toString() ?? 'N/A');
            box.write('aadhaarFImg',
                profileModel?.data?.aadharFrontImg?.toString() ?? 'N/A');
            box.write('aadhaarBImg',
                profileModel?.data?.aadharBackImg?.toString() ?? 'N/A');
            box.write('chequeImg',
                profileModel?.data?.chequeImg?.toString() ?? 'N/A');
            box.write(
                'gstImg', profileModel?.data?.gstImg?.toString() ?? 'N/A');
            if (profileModel?.data?.status == 0) {
              Get.dialog(
                  AlertDialog(
                    title: const Text("Account Status"),
                    content: const Text(
                        "Account is under review\nPlease connect with the support team."),
                    backgroundColor: Colors.white,
                    actions: [
                      TextButton(
                        onPressed: () {
                          Get.back(); // Close the dialog box
                        },
                        child: const Text("OK"),
                      ),
                    ],
                  ),
                  barrierDismissible: false);
            }
          }
        } else if (responseBody['status'] == 402) {
          DeviceInformation.logoutUser();
        } else {
          log('something went wrong in server side ${responseBody['status']}');
        }
      } else {
        log('something went wrong statuscodde :-< ${response.statusCode}');
      }
    } on SocketException {
      log('socket excetion ');
    } catch (e) {
      log("get User Status Error->$e");
    }
  }
}
