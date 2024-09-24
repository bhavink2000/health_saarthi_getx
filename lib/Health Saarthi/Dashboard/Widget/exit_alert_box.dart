import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import '../../App Helper/font_&_color_helper.dart';

class ExitAlertBox extends StatelessWidget {
  const ExitAlertBox({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset(
              "assets/health_saarthi_logo_transparent_bg.png",
              width: 150,
            ),
            const Padding(
              padding: EdgeInsets.all(5),
              child: Text(
                "Are you sure you want to exit.?",
                style: TextStyle(
                    fontFamily: FontHelper.montserratMedium, fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextButton(
                  child: const Text(
                    "Stay",
                    style: TextStyle(
                        fontFamily: FontHelper.montserratMedium,
                        letterSpacing: 2),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                TextButton(
                  child: const Text(
                    "Exit",
                    style: TextStyle(
                        fontFamily: FontHelper.montserratMedium,
                        letterSpacing: 2),
                  ),
                  onPressed: () {
                    exit(0);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
