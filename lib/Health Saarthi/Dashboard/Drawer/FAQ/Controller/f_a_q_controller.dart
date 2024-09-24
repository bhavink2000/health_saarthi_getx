import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Device%20Information/device_information.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Model%20Helper/Drawer%20Menu/faqs_model.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Netwok%20Helper/api_url_helper.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/snakebar_helper.dart';
import 'package:http/http.dart' as http;

class FAQController extends GetxController {
  @override
  void onInit() {
    fetchFaqs();
    super.onInit();
  }

  final box = GetStorage();

  Rx<FaqsModel> faqModel = FaqsModel().obs;
  RxBool loading = false.obs;
  Future<void> fetchFaqs() async {
    loading(true);
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${box.read('accessToken')}',
    };
    final response =
        await http.get(Uri.parse(ApiHelper.faqsUrls), headers: headers);

    var responseBody = jsonDecode(response.body);
    if (response.statusCode == 200) {
      if (responseBody['status'] == 200) {
        faqModel = FaqsModel.fromJson(responseBody).obs;
        loading(false);
      } else if (responseBody['status' == '402']) {
        DeviceInformation.logoutUser();
        SnackBarHelper.getWarningMsg(responseBody['message']);
        loading(false);
      }
    } else {
      log('something went wrong :-< status code ${response.statusCode}');
      loading(false);
    }
  }
}
