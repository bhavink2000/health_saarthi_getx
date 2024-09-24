import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Widget%20Helper/common_profile_image_view.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Widget%20Helper/common_text_field.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/snakebar_helper.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/Dashboard/Bottom%20Menu%20Screens/Profile%20Menu/Change%20Password/change_password_screen.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/Dashboard/Bottom%20Menu%20Screens/Profile%20Menu/Controller/profile_controller.dart';

import '../../../App Helper/app_text_helper.dart';
import '../../../App Helper/font_&_color_helper.dart';

class ProfileMenu extends StatelessWidget {
  final bool isFromDrawer;
  const ProfileMenu({super.key, this.isFromDrawer = false});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: isFromDrawer == false
          ? null
          : AppBar(
              backgroundColor: ColorHelper.hsPrimeOne,
              iconTheme: const IconThemeData(color: Colors.white),
              actions: const [
                Text(
                  'Profile',
                  style: TextStyle(
                      fontFamily: FontHelper.montserratMedium,
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 10)
              ],
            ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              isFromDrawer == false
                  ? const SizedBox()
                  : const SizedBox(height: 5),
              CommonTextField(
                label: 'Name',
                readOnly: true,
                controller: controller.firstNm,
                prefixIcon:
                    Icon(Icons.person, color: ColorHelper.hsBlack, size: 20),
              ),
              CommonTextField(
                label: 'Mobile',
                readOnly: true,
                controller: controller.mobile,
                prefixIcon: Icon(Icons.mobile_friendly,
                    color: ColorHelper.hsBlack, size: 20),
              ),
              CommonTextField(
                label: 'Email',
                readOnly: true,
                controller: controller.email,
                prefixIcon:
                    Icon(Icons.email, color: ColorHelper.hsBlack, size: 20),
              ),
              CommonTextField(
                label: 'Address',
                readOnly: true,
                controller: controller.address,
                prefixIcon: Icon(Icons.location_city,
                    color: ColorHelper.hsBlack, size: 20),
              ),
              CommonTextField(
                label: 'State',
                readOnly: true,
                controller: controller.state,
                prefixIcon: Icon(Icons.query_stats,
                    color: ColorHelper.hsBlack, size: 20),
              ),
              CommonTextField(
                label: 'City',
                readOnly: true,
                controller: controller.city,
                prefixIcon: Icon(Icons.reduce_capacity,
                    color: ColorHelper.hsBlack, size: 20),
              ),
              CommonTextField(
                label: 'Area',
                readOnly: true,
                controller: controller.area,
                prefixIcon: Icon(Icons.area_chart,
                    color: ColorHelper.hsBlack, size: 20),
              ),
              CommonTextField(
                label: 'Branch',
                readOnly: true,
                controller: controller.branch,
                prefixIcon: Icon(Icons.location_city,
                    color: ColorHelper.hsBlack, size: 20),
                maxLines: 1,
              ),
              CommonTextField(
                label: 'Pincode',
                readOnly: true,
                controller: controller.pincode,
                prefixIcon: Icon(Icons.code_rounded,
                    color: ColorHelper.hsBlack, size: 20),
                maxLines: 1,
              ),
              CommonTextField(
                label: 'Bank name',
                readOnly: true,
                controller: controller.bankNm,
                prefixIcon: Icon(Icons.account_balance_rounded,
                    color: ColorHelper.hsBlack, size: 20),
                maxLines: 1,
              ),
              CommonTextField(
                label: 'IFSC code',
                readOnly: true,
                controller: controller.ifscCode,
                prefixIcon: Icon(Icons.account_tree_rounded,
                    color: ColorHelper.hsBlack, size: 20),
                maxLines: 1,
              ),
              CommonTextField(
                label: 'Account number',
                readOnly: true,
                controller: controller.accountNo,
                prefixIcon: Icon(Icons.account_balance_wallet_rounded,
                    color: ColorHelper.hsBlack, size: 20),
                maxLines: 1,
              ),
              CommonTextField(
                label: 'gstNo',
                readOnly: true,
                controller: controller.gstNo,
                prefixIcon: Icon(Icons.app_registration_rounded,
                    color: ColorHelper.hsBlack, size: 20),
              ),
              CommonTextField(
                label: 'Change Password',
                readOnly: true,
                onTap: () => Get.to(() => const ChangePasswordScreen()),
                suffixIcon: const Icon(Icons.keyboard_arrow_right_rounded),
              ),
              CommonProfileImageView(
                label: 'Pan Card',
                fileName: controller.panCard,
                imageUrl: controller.panCardImg,
                file: controller.panCardChange,
              ),
              CommonProfileImageView(
                label: 'Aadhaar card front',
                fileName: controller.aadharCardF,
                imageUrl: controller.aadharCardFImg,
                file: controller.aadhaarCardFChange,
              ),
              CommonProfileImageView(
                label: 'Aadhaar card back',
                fileName: controller.aadharCardB,
                imageUrl: controller.aadharCardBImg,
                file: controller.aadhaarCardBChange,
              ),
              CommonProfileImageView(
                label: 'Address proof',
                fileName: controller.addressProfe,
                imageUrl: controller.addressProfeImg,
                file: controller.addressChange,
              ),
              CommonProfileImageView(
                label: 'Cheque image',
                fileName: controller.chequeFile,
                imageUrl: controller.chequeImg,
                file: controller.chequeChange,
              ),
              CommonProfileImageView(
                label: 'GST file image',
                fileName: controller.gstFile,
                imageUrl: controller.gstImg,
                file: controller.gstFileChange,
              ),
              Obx(() => controller.userStatus.value == 0
                  ? ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor: ColorHelper.hsPrime),
                      onPressed: () {
                        if (controller.userStatus.value == 0) {
                          controller.updateProfileData();
                        } else if (controller.userStatus.value == 1) {
                          SnackBarHelper.getWarningMsg(
                              AppTextHelper.notUpdateUser);
                        } else {
                          SnackBarHelper.getWarningMsg(
                              AppTextHelper.userNotFound);
                        }
                      },
                      child: const Text("Update profile",
                          style: TextStyle(
                              fontFamily: FontHelper.montserratMedium,
                              color: Colors.white)))
                  : Container()),
              isFromDrawer ? Container() : const SizedBox(height: 70)
            ],
          ),
        ),
      ),
    );
  }
}
