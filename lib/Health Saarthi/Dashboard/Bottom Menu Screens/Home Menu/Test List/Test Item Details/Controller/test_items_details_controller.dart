import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Netwok%20Helper/api_url_helper.dart';
import 'package:http/http.dart' as http;

class TestItemsDetailsController extends GetxController {
  int? testId;
  TestItemsDetailsController({this.testId});

  @override
  void onInit() {
    fetchTestDetails();
    super.onInit();
  }

  RxBool isLoading = false.obs;
  RxList testDetailsData = [].obs;
  Future<void> fetchTestDetails() async {
    isLoading(true);
    final box = GetStorage();
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${box.read('accessToken')}',
    };
    try {
      final response = await http
          .get(Uri.parse("${ApiHelper.testItemDetailsUrls}$testId"),
              headers: headers)
          .timeout(const Duration(seconds: 30));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        testDetailsData.add(data['data']);
        isLoading(false);
        log("booked status->${testDetailsData[0]['booked_status']}");
      } else {
        isLoading(false);
        throw Exception("Failed to load data");
      }
    } catch (e) {
      log("e->$e");
      isLoading(false);
      throw Exception("Failed to load data $e");
    }
  }
}
