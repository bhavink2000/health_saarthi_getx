import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Widget%20Helper/common_text_field.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/font_&_color_helper.dart';
import 'Controller/change_password_controller.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChangePasswordController());
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: ColorHelper.hsPrime,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: const [
          Text(
            'Change Password',
            style: TextStyle(
                fontFamily: FontHelper.montserratMedium,
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 10)
        ],
      ),
      body: Form(
        key: controller.changePasswordFormKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              const SizedBox(height: 5),
              CommonTextField(
                label: 'Current Password',
                autoValidateMode: AutovalidateMode.onUserInteraction,
                controller: controller.currentPassword,
                prefixIcon: Icon(Icons.password_rounded,
                    color: ColorHelper.hsBlack, size: 20),
                onChanged: (value) {
                  if (value.length >= 8 &&
                      value.contains(RegExp(r'[A-Z]')) &&
                      value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]')) &&
                      value.contains(RegExp(r'[0-9]'))) {
                    // Password meets all the requirements
                  } else {
                    log('Password does not meet the requirements.');
                  }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter current password';
                  }
                  if (value.trim().length < 8) {
                    return 'Password must be at least 8 characters in length';
                  }
                  if (!value.contains(RegExp(r'[A-Z]'))) {
                    return 'Password must contain at least one uppercase letter';
                  }
                  if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                    return 'Password must contain at least one special character';
                  }
                  return null;
                },
              ),
              Obx(
                () => CommonTextField(
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  controller: controller.password,
                  obscureText: controller.obScured.value,
                  label: 'Password',
                  maxLines: 1,
                  prefixIcon: Icon(Icons.lock_open_rounded,
                      color: ColorHelper.hsBlack, size: 20),
                  suffixIcon: InkWell(
                    onTap: controller.togglePasswordView,
                    child: Icon(
                      controller.obScured.value
                          ? Icons.visibility_off_rounded
                          : Icons.visibility_rounded,
                      color: Colors.black,
                    ),
                  ),
                  onChanged: (value) {
                    if (value.length >= 8 &&
                        value.contains(RegExp(r'[A-Z]')) &&
                        value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]')) &&
                        value.contains(RegExp(r'[0-9]'))) {
                      // Password meets all the requirements
                    } else {
                      log('Password does not meet the requirements.');
                    }
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter new password';
                    }
                    if (value.trim().length < 8) {
                      return 'Password must be at least 8 characters in length';
                    }
                    if (!value.contains(RegExp(r'[A-Z]'))) {
                      return 'Password must contain at least one uppercase letter';
                    }
                    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                      return 'Password must contain at least one special character';
                    }
                    return null;
                  },
                ),
              ),
              Obx(
                () => CommonTextField(
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  controller: controller.cPassword,
                  obscureText: controller.obCScured.value,
                  label: 'Confirm Password',
                  maxLines: 1,
                  prefixIcon: Icon(Icons.lock_open_rounded,
                      color: ColorHelper.hsBlack, size: 20),
                  suffixIcon: InkWell(
                    onTap: controller.toggleCPasswordView,
                    child: Icon(
                      controller.obCScured.value
                          ? Icons.visibility_off_rounded
                          : Icons.visibility_rounded,
                      color: Colors.black,
                    ),
                  ),
                  onChanged: (value) {
                    if (value.length >= 8 &&
                        value.contains(RegExp(r'[A-Z]')) &&
                        value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]')) &&
                        value.contains(RegExp(r'[0-9]'))) {
                      // Password meets all the requirements
                    } else {
                      log('Password does not meet the requirements.');
                    }
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter confirm password';
                    }
                    if (value.trim().length < 8) {
                      return 'Password must be at least 8 characters in length';
                    }
                    if (!value.contains(RegExp(r'[A-Z]'))) {
                      return 'Password must contain at least one uppercase letter';
                    }
                    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                      return 'Password must contain at least one special character';
                    }
                    if (controller.password.text != controller.cPassword.text) {
                      return 'Password not match';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      color: ColorHelper.hsPrime,
                      child: InkWell(
                        onTap: (){
                          controller.currentPassword.text = "";
                          controller.password.text = "";
                          controller.cPassword.text = "";
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          width: Get.width / 3,
                          padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
                          alignment: Alignment.center,
                          child: const Text(
                            "Cancel",
                            style: TextStyle(fontFamily: FontHelper.montserratRegular,color: Colors.white,fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      color: ColorHelper.hsPrime,
                      child: InkWell(
                        onTap: (){
                          if(controller.changePasswordFormKey.currentState!.validate()){
                            controller.getChangePass();
                          }
                        },
                        child: Container(
                          width: Get.width / 3,
                          padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
                          alignment: Alignment.center,
                          child: const Text(
                            "Submit",
                            style: TextStyle(fontFamily: FontHelper.montserratRegular,color: Colors.white,fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
