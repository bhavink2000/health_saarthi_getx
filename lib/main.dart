import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/font_&_color_helper.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/Authentication%20Screens/Splash%20Screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return GetMaterialApp(
      theme: ThemeData(
          fontFamily: 'Montserrat-Regular',
          colorScheme: ThemeData().colorScheme.copyWith(
              primary: ColorHelper.hsPrime, secondary: ColorHelper.hsPrimeOne),
          scrollbarTheme: ScrollbarThemeData(
            thumbVisibility: MaterialStateProperty.all<bool>(true),
          ),
          appBarTheme:
              const AppBarTheme(scrolledUnderElevation: 0, elevation: 0)),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
