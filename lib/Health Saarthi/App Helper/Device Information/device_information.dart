import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Netwok%20Helper/api_url_helper.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/snakebar_helper.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/Authentication%20Screens/Login%20Screen/login_screen.dart';
import 'package:http/http.dart' as http;

class DeviceInformation {
  static int? getDeviceType() {
    if (GetPlatform.isAndroid) {
      return 0;
    } else if (GetPlatform.isIOS) {
      return 1;
    }
    return null;
  }

  static Future<void> logoutUser() async {
    var bodyMsg;
    final box = GetStorage();
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${box.read('accessToken')}',
    };
    try {
      final response = await http.post(
        Uri.parse(ApiHelper.logoutUrl),
        headers: headers,
      );
      final responseData = json.decode(response.body);
      var bodyStatus = responseData['status'];
      bodyMsg = responseData['message'];

      if (bodyStatus == 200) {
        SnackBarHelper.getSuccessMsg('$bodyMsg');
        final box = GetStorage();
        box.erase().then((value) {
          Get.offAll(() => LoginScreen());
        });
      } else {
        final box = GetStorage();
        box.erase().then((value) {
          Get.offAll(() => LoginScreen());
        });
      }
    } catch (error) {
      log(error.toString());
      final box = GetStorage();
      box.erase().then((value) {
        Get.offAll(() => LoginScreen());
      });
    }
  }

  static Future<int?> getUserStatus() async {
    try {
      // String? token = AuthenticationManager.getToken();
      final box = GetStorage();
      final response = await http.get(Uri.parse(ApiHelper.profileUrls),
          headers: {'Authorization': 'Bearer ${box.read('accessToken')}'});

      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        if (responseBody['status'] == 200) {
          // profileModel = ProfileModel.fromJson(responseBody);
          int? userStatus = responseBody['data']['status'];
          if (userStatus != null) {
            log(userStatus.toString());
            return userStatus;
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
    return null;
  }
}
