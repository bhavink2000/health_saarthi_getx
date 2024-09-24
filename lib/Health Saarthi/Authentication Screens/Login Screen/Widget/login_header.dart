import 'package:flutter/material.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/font_&_color_helper.dart';
import 'fade_slide_transtion.dart';

class LoginHeader extends StatelessWidget {
  final Animation<double> animation;
  const LoginHeader({super.key, required this.animation});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: PaddingHelper.hsPaddingL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 0.0,
            child: const Text('Welcome to \nHealth Saarthi',
                style: TextStyle(
                    fontFamily: FontHelper.montserratMedium, fontSize: 25)),
          ),
          const SizedBox(height: SpacingHelper.hsSpaceS),
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 16.0,
            child: const Text(
                'Declare the past, diagnose the present, foretell the future.',
                style: TextStyle(
                    fontFamily: FontHelper.montserratRegular, fontSize: 16)),
          ),
        ],
      ),
    );
  }
}
