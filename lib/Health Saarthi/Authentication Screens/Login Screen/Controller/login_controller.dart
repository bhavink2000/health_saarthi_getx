import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Token%20Helper/authentication_manager.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/font_&_color_helper.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/Dashboard/dashboard.dart';
import 'package:http/http.dart' as http;

import '../../../App Helper/Device Information/device_information.dart';
import '../../../App Helper/Model Helper/Authentication Models/login_model.dart';
import '../../../App Helper/Netwok Helper/api_url_helper.dart';
import '../../../App Helper/snakebar_helper.dart';

class LoginController extends GetxController
    with GetSingleTickerProviderStateMixin {
  AnimationController? animationController;
  late Animation<double> headerTextAnimation;
  late Animation<double> formElementAnimation;
  late Animation<double> whiteTopClipperAnimation;
  late Animation<double> blueTopClipperAnimation;
  late Animation<double> greyTopClipperAnimation;

  final mobileNumber = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  RxBool obScured = true.obs;
  void togglePasswordView() {
    obScured.value = !obScured.value;
  }

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      vsync: this,
      duration: AnimationDurationHelper.hsLoginAnimationD,
    );

    final fadeSlideTween = Tween<double>(begin: 0.0, end: 1.0);
    headerTextAnimation = fadeSlideTween.animate(CurvedAnimation(
      parent: animationController!,
      curve: const Interval(
        0.0,
        0.6,
        curve: Curves.easeInOut,
      ),
    ));
    formElementAnimation = fadeSlideTween.animate(CurvedAnimation(
      parent: animationController!,
      curve: const Interval(
        0.7,
        1.0,
        curve: Curves.easeInOut,
      ),
    ));

    const double defaultScreenH = 600.0; // Provide a default value here
    final clipperOffsetTween = Tween<double>(
      begin: defaultScreenH,
      end: 0.0,
    );
    blueTopClipperAnimation = clipperOffsetTween.animate(
      CurvedAnimation(
        parent: animationController!,
        curve: const Interval(
          0.2,
          0.7,
          curve: Curves.easeInOut,
        ),
      ),
    );
    greyTopClipperAnimation = clipperOffsetTween.animate(
      CurvedAnimation(
        parent: animationController!,
        curve: const Interval(
          0.35,
          0.7,
          curve: Curves.easeInOut,
        ),
      ),
    );
    whiteTopClipperAnimation = clipperOffsetTween.animate(
      CurvedAnimation(
        parent: animationController!,
        curve: const Interval(
          0.5,
          0.7,
          curve: Curves.easeInOut,
        ),
      ),
    );
    animationController!.forward();
    // login on init code will be here
  }

  LoginModel? loginModel;
  RxBool loginLoading = false.obs;
  Future<void> getLogin() async {
    loginLoading(true);
    try {
      final box = GetStorage();
      int? deviceType;
      deviceType = box.read('deviceType');
      if (deviceType == null) {
        int? deviceType = DeviceInformation.getDeviceType();
        box.write('deviceType', deviceType);
      }
      Map data = {
        "mobile": mobileNumber.text,
        "password": password.text,
        "device_token": 'ada',
        'device_type': '$deviceType',
      };
      final response =
          await http.post(Uri.parse(ApiHelper.loginUrl), body: data);
      final responseBody = jsonDecode(response.body);
      loginModel = LoginModel.fromJson(responseBody);
      log('login response :-> $responseBody');
      if (loginModel?.status == 200) {
        loginLoading(false);
        log('logged in successfully');
        log('login model :-> ${loginModel?.data?.emailId}');
        //savetoken
        AuthenticationManager.saveToken(loginModel?.accessToken.toString());
        SnackBarHelper.getSuccessMsg('login Successfully');
        Get.offAll(() => const Dashboard());
      } else if (loginModel?.status == 400) {
        loginLoading(false);
        var errorMessage = responseBody['error']['message'] != null
            ? responseBody['error']['message'][0]
            : null;
        var mobileError = responseBody['error']['mobile'] != null
            ? responseBody['error']['mobile'][0]
            : null;
        var passwordError = responseBody['error']['password'] != null
            ? responseBody['error']['password'][0]
            : null;

        if (errorMessage != null) {
          SnackBarHelper.getWarningMsg('$errorMessage');
        } else if (mobileError != null) {
          SnackBarHelper.getWarningMsg('$mobileError');
        } else if (passwordError != null) {
          SnackBarHelper.getWarningMsg('$passwordError');
        } else {
          log("in else");
        }
      } else if (loginModel?.status == 500) {
        loginLoading(false);
        log('Internal server error');
        SnackBarHelper.getWarningMsg('Internal server error!');
      }
    } on SocketException {
      loginLoading(false);
      log('in login socket exception');
    } catch (e) {
      loginLoading(false);
      log('something went wrong in login :-< $e');
    }
  }
}
