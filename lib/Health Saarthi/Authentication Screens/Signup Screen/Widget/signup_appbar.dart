import 'package:flutter/material.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/font_&_color_helper.dart';

PreferredSizeWidget signupAppBar() {
  return AppBar(
    scrolledUnderElevation: 0,
    backgroundColor: Colors.white,
    title: const Text(
      'Sign up',
      style: TextStyle(fontFamily: FontHelper.montserratMedium, fontSize: 18),
    ),
  );
}
