import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> connectivitySubscription;
  RxBool dialog = false.obs;
  @override
  void onInit() {
    super.onInit();
    initConnectivity();
    connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> initConnectivity() async {
    ConnectivityResult? result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      log(e.toString());
    }
    return _updateConnectionStatus(result!);
  }

  _updateConnectionStatus(ConnectivityResult result) {
    if (result == ConnectivityResult.none) {
      dialog(true);
      Get.dialog(
        const PopScope(
          canPop: false,
          child: AlertDialog(
            icon: Icon(Icons.wifi_off),
            iconColor: Colors.white,
            backgroundColor: Colors.red,
            title: Text('Unable to connect.'),
            titleTextStyle: TextStyle(color: Colors.white),
            content: Text(
              'Please verify your internet connection and try again.',
              textAlign: TextAlign.center,
            ),
            contentTextStyle: TextStyle(color: Colors.white),
          ),
        ),
      );
    } else {
      if (dialog.value == true) {
        dialog(false);
        Get.closeCurrentSnackbar();
        Get.back();
      }
    }
  }

  @override
  void onClose() {}
}
