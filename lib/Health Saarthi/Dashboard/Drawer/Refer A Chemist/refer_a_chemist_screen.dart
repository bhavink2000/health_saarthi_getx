import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Widget%20Helper/common_text_field.dart';

import '../../../App Helper/font_&_color_helper.dart';
import 'Controller/refer_a_chemist_controller.dart';

class ReferAChemistScreen extends StatelessWidget {
  const ReferAChemistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ReferAChemistController());
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: ColorHelper.hsPrimeOne,
        actions: const [
          Text(
            "Refer Chemist",
            style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontFamily: FontHelper.montserratMedium,
                letterSpacing: 1),
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Container(
        width: Get.width,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: controller.referFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                  child: CommonTextField(
                      controller: controller.fName,
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                      label: 'First Name',
                      prefixIcon: const Icon(Icons.person,
                          color: Colors.black, size: 24),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter name';
                        }
                        return null;
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: CommonTextField(
                      controller: controller.mobile,
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.phone,
                      label: 'Mobile Number',
                      prefixIcon: const Icon(Icons.phone_android_rounded,
                          color: Colors.black, size: 24),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter mobile number';
                        }
                        return null;
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                  child: CommonTextField(
                    controller: controller.email,
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.emailAddress,
                    label: 'Email Id',
                    prefixIcon: const Icon(Icons.email_rounded,
                        color: Colors.black, size: 24),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter email id';
                      }
                      if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                        return 'email id must contain at least one special character';
                      }
                      return null;
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        controller.fName.clear();
                        controller.mobile.clear();
                        controller.email.clear();
                        Get.back();
                      },
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: ColorHelper.hsPrime),
                        child: const Text(
                          "Cancel",
                          style: TextStyle(
                              fontFamily: FontHelper.montserratMedium,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if (controller.referFormKey.currentState!.validate()) {
                          controller.sendReferralPharmacy();
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: ColorHelper.hsPrime),
                        child: const Text(
                          "Submit",
                          style: TextStyle(
                              fontFamily: FontHelper.montserratMedium,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
