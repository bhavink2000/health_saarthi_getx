import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Model%20Helper/Home%20Menu/test_model.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Netwok%20Helper/api_url_helper.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Token%20Helper/authentication_manager.dart';
import 'package:http/http.dart' as http;

class TestListController extends GetxController {
  String? accessToken;
  @override
  void onInit() {
    accessToken = AuthenticationManager.getToken();
    fetchTest(1);
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
  Rx<TestModel> testModel = TestModel().obs;
  Future<void> fetchTest(int index) async {
    testLoading(true);
    try {
      Map testData = {
        'search': testSearch.text,
      };
      final response =
          await http.post(Uri.parse('${ApiHelper.testListUrls}?page=$index'),
              headers: {
                'Accept': 'application/json',
                'Authorization': 'Bearer $accessToken',
              },
              body: testData);
      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        if (responseBody['status'] == 200) {
          testModel.value = TestModel.fromJson(responseBody);
          testLoading(false);
        }
      } else {
        log('something went wrong in fetch test status code -> ${response.statusCode}');
        testLoading(false);
      }
    } catch (e) {
      log('error in fetch test list $e');
      testLoading(false);
    }
  }
}
