import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/font_&_color_helper.dart';

//ignore: must_be_immutable
class GenderSelectionWidget extends StatelessWidget {
  RxString groupValue;
  GenderSelectionWidget({super.key, required this.groupValue});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        radioTile('Male'),
        radioTile('Female'),
        radioTile('Other'),
      ],
    );
  }

  Widget radioTile(String title) {
    return Flexible(
      fit: FlexFit.loose,
      child: Theme(
        data: ThemeData(
            listTileTheme: const ListTileThemeData(horizontalTitleGap: 4)),
        child: Obx(
          () => RadioListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            title: Text(
              title,
              style: const TextStyle(fontFamily: FontHelper.montserratRegular),
            ),
            value: title,
            groupValue: groupValue.value,
            onChanged: (value) {
              groupValue.value = value as String;
              log(groupValue.value);
            },
          ),
        ),
      ),
    );
  }
}
