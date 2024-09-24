import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Model%20Helper/Dashboard%20Model/notification_model.dart';
import 'package:http/http.dart' as http;
import '../../../App Helper/Device Information/device_information.dart';
import '../../../App Helper/Netwok Helper/api_url_helper.dart';

class NotificationController extends GetxController {
  @override
  void onInit() {
    fetchNotification();
    super.onInit();
  }

  RxBool notificationLoading = false.obs;
  Rx<NotificationModel> notificationModel = NotificationModel().obs;
  fetchNotification() async {
    notificationLoading(true);
    try {
      final box = GetStorage();
      final response =
          await http.post(Uri.parse(ApiHelper.notificationUrls), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${box.read('accessToken')}',
      });
      var responseBody = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (responseBody['status'] == 200) {
          notificationModel.value = NotificationModel.fromJson(responseBody);
          notificationLoading(false);
        } else if (responseBody['status'] == '402') {
          log('402 error :-<');
          notificationLoading(false);
          DeviceInformation.logoutUser();
        } else {
          notificationLoading(false);
          log('something went wrong status code :-< ${responseBody['status']}');
        }
      } else {
        log('something went wrong in fetching notification');
        log('response body => $responseBody}');
        notificationLoading(false);
      }
    } catch (e) {
      log('some thing went wrong $e');
      notificationLoading(false);
    }
  }
}
