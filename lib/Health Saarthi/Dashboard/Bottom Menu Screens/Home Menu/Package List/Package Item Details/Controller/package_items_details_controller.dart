import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Netwok%20Helper/api_url_helper.dart';
import 'package:http/http.dart' as http;

class PackageItemsDetailsController extends GetxController {
  int? packageId;
  PackageItemsDetailsController({this.packageId});

  @override
  void onInit() {
    fetchPackageDetails();
    super.onInit();
  }

  RxList packageDetailsData = [].obs;
  RxBool isLoading = false.obs;
  Future<void> fetchPackageDetails() async {
    isLoading(true);
    final box = GetStorage();
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${box.read('accessToken')}',
    };
    try {
      final response = await http
          .get(
            Uri.parse("${ApiHelper.packageItemDetailsUrls}$packageId"),
            headers: headers,
          )
          .timeout(const Duration(seconds: 30));
      log('response--->${response.body}');
      log('response--->${response.statusCode}');
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        packageDetailsData.add(data['data']);
        isLoading(false);
        log("booked status->${packageDetailsData[0]['booked_status']}");
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
