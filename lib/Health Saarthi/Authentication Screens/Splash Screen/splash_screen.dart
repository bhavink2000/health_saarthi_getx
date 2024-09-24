import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/font_&_color_helper.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/Dashboard/dashboard.dart';
import '../../App Helper/Device Information/device_information.dart';
import '../../App Helper/Token Helper/authentication_manager.dart';
import '../Login Screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    int? deviceType = DeviceInformation.getDeviceType();
    final box = GetStorage();
    box.write('deviceType', deviceType);
    Future.delayed(const Duration(seconds: 3), () {
      var token = AuthenticationManager.getToken();
      token != null ? Get.off(() => const Dashboard()) : Get.off(() => LoginScreen());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height / 4),
              const Padding(
                padding: EdgeInsets.all(15),
                child: Image(
                  image: AssetImage("assets/Gif/HS_Blood test_GIF.gif"),
                ),
              ),
              const Spacer(),
              const Padding(
                padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: Image(
                  image: AssetImage("assets/health_saarthi_logo.png"),
                  width: 150,
                ),
              ),
              const Text("Version 2.0",
                  style: TextStyle(
                      fontFamily: FontHelper.montserratMedium,
                      color: Colors.grey))
            ],
          ),
        ));
  }
}
