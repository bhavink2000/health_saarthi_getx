import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/font_&_color_helper.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/snakebar_helper.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/Authentication%20Screens/Login%20Screen/Forgot%20Password%20Screen/OTP%20Verification%20Screen/Forgot%20Password%20Update/Controller/forgot_password_update_controller.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/Authentication%20Screens/Login%20Screen/login_screen.dart';

import '../../../../../App Helper/app_text_helper.dart';

class ForgotPasswordUpdateScreen extends StatelessWidget {
  final String mobileNumber;
  const ForgotPasswordUpdateScreen({super.key, required this.mobileNumber});

  @override
  Widget build(BuildContext context) {
    final controller =
        Get.put(ForgotPasswordUpdateController(mobileNumber: mobileNumber));
    Color clr = const Color(0xfff7f6fb);
    return Scaffold(
      backgroundColor: clr,
      appBar: AppBar(backgroundColor: clr),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 18),
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade50,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                'assets/Gif/otp_verify.gif',
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Change Password',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(28),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  TextField(
                    readOnly: true,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.all(PaddingHelper.hsPaddingM),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black.withOpacity(0.12)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black.withOpacity(0.12)),
                      ),
                      hintText: mobileNumber,
                      hintStyle: const TextStyle(
                          color: Colors.black54,
                          fontFamily: FontHelper.montserratRegular,
                          fontSize: 14),
                      prefixIcon: Icon(Icons.phone_android_rounded,
                          color: ColorHelper.hsBlack, size: 20),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Obx(
                    () => TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: controller.password,
                      obscureText: controller.obScured.value,
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.all(PaddingHelper.hsPaddingM),
                        border: const OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black.withOpacity(0.12)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black.withOpacity(0.12)),
                        ),
                        hintText: 'Password *',
                        hintStyle: const TextStyle(
                            color: Colors.black54,
                            fontFamily: FontHelper.montserratRegular,
                            fontSize: 14),
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
                      ),
                      onChanged: (value) {
                        if (value.length >= 8 &&
                            value.contains(RegExp(r'[A-Z]')) &&
                            value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]')) &&
                            value.contains(RegExp(r'[0-9]'))) {
                          // Password meets all the requirements
                        } else {
                          print('Password does not meet the requirements.');
                        }
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter a password';
                        }
                        if (value.trim().length < 8) {
                          return 'Password must be at least 8 characters in length';
                        }
                        if (!value.contains(RegExp(r'[A-Z]'))) {
                          return 'Password must contain at least one uppercase letter';
                        }
                        if (!value
                            .contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                          return 'Password must contain at least one special character';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Obx(
                    () => TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: controller.cPassword,
                      obscureText: controller.obCScured.value,
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.all(PaddingHelper.hsPaddingM),
                        border: const OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black.withOpacity(0.12)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black.withOpacity(0.12)),
                        ),
                        hintText: 'Confirm password *',
                        hintStyle: const TextStyle(
                            color: Colors.black54,
                            fontFamily: FontHelper.montserratRegular,
                            fontSize: 14),
                        prefixIcon: Icon(Icons.lock_outline_rounded,
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
                      ),
                      onChanged: (value) {
                        if (value.length >= 8 &&
                            value.contains(RegExp(r'[A-Z]')) &&
                            value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]')) &&
                            value.contains(RegExp(r'[0-9]'))) {
                          // Password meets all the requirements
                        } else {
                          print('Password does not meet the requirements.');
                        }
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter a password';
                        }
                        if (value.trim().length < 8) {
                          return 'Password must be at least 8 characters in length';
                        }
                        if (!value.contains(RegExp(r'[A-Z]'))) {
                          return 'Password must contain at least one uppercase letter';
                        }
                        if (!value
                            .contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                          return 'Password must contain at least one special character';
                        }
                        if (value != controller.password.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (controller.password.text.isEmpty) {
                          SnackBarHelper.getWarningMsg(
                              AppTextHelper.enterPassword);
                        } else {
                          if (controller.cPassword.text.isEmpty) {
                            SnackBarHelper.getWarningMsg(
                                AppTextHelper.enterCPassword);
                          } else {
                            if (controller.password.text ==
                                controller.cPassword.text) {
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    child: Container(
                                      padding: const EdgeInsets.all(20),
                                      child: const Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          CircularProgressIndicator(), // Loading indicator
                                          SizedBox(height: 16),
                                          Text(
                                            'Updating password...', // Loading message
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                              try {
                                var responseMessage =
                                    await controller.getForgotPass();
                                if (responseMessage == 200) {
                                  print('responseMessage->$responseMessage');
                                  controller.password.text = '';
                                  controller.cPassword.text = '';
                                  Get.offAll(() => LoginScreen());
                                } else {
                                  print("in else");
                                  Get.back();
                                }
                              } catch (error) {
                                Get.back();
                              }
                            } else {
                              SnackBarHelper.getWarningMsg(
                                  AppTextHelper.enterCPNotMatch);
                            }
                          }
                        }
                      },
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            ColorHelper.hsPrime),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(14.0),
                        child: Text(
                          'Submit',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
