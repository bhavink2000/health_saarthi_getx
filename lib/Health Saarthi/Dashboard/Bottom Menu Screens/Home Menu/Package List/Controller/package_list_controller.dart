import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Model%20Helper/Home%20Menu/package_model.dart';
import 'package:http/http.dart' as http;
import '../../../../../App Helper/Netwok Helper/api_url_helper.dart';
import '../../../../../App Helper/Token Helper/authentication_manager.dart';

class PackageListController extends GetxController {
  String? accessToken;
  @override
  void onInit() {
    accessToken = AuthenticationManager.getToken();
    fetchPackage(1);
    super.onInit();
  }

  @override
  void onClose() {
    testSearch.dispose();
    super.onClose();
  }

  final testSearch = TextEditingController();

  RxInt currentIndex = 0.obs;

  RxBool testLoading = false.obs;
  // Rx<TestModel> testModel = TestModel().obs;
  Rx<PackageModel> packageModel = PackageModel().obs;
  Future<void> fetchPackage(int index) async {
    testLoading(true);
    try {
      Map testData = {
        'search': testSearch.text,
      };
      final response =
          await http.post(Uri.parse('${ApiHelper.packageListUrls}?page=$index'),
              headers: {
                'Accept': 'application/json',
                'Authorization': 'Bearer $accessToken',
              },
              body: testData);
      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        if (responseBody['status'] == 200) {
          packageModel.value = PackageModel.fromJson(responseBody);
          testLoading(false);
        }
      } else {
        log('something went wrong in fetch package status code -> ${response.statusCode}');
        testLoading(false);
      }
    } catch (e) {
      log('error in fetch package list $e');
      testLoading(false);
    }
  }
}
