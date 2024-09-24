import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Widget%20Helper/common_dropdown.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Widget%20Helper/common_dropdown_search.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Widget%20Helper/common_file_picker_tile.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Widget%20Helper/common_text_field.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/snakebar_helper.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/validator_helper.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/Authentication%20Screens/Signup%20Screen/Widget/signup_appbar.dart';

import '../../App Helper/app_text_helper.dart';
import '../../App Helper/font_&_color_helper.dart';
import 'Controller/signup_controller.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  final controller = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    final space =
        Get.height > 650 ? SpacingHelper.hsSpaceM : SpacingHelper.hsSpaceS;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: signupAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Form(
          key: controller.signupFormKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Obx(
                  () => CommonDropdown(
                    label: 'B2B Sub Admin',
                    selectedValue: controller.selectedB2b.value == ''
                        ? null
                        : controller.selectedB2b.value,
                    onChanged: (value) {
                      controller.selectedB2b.value = value;
                    },
                    items: [
                      const DropdownMenuItem(
                        value: '',
                        child: Text('Select B2B subadmin'),
                      ),
                      ...controller.b2bSubAdminList
                          .map((subAdmin) => DropdownMenuItem(
                                value: subAdmin['id'].toString(),
                                child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 1.5,
                                    child: Text(subAdmin['name'])),
                              ))
                          .toList()
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                CommonTextField(
                  controller: controller.vendorName,
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  label: 'Vendor name',
                  isRequiredField: true,
                  prefixIcon:
                      Icon(Icons.person, color: ColorHelper.hsBlack, size: 20),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Vendor name';
                    }
                    return null;
                  },
                ),
                CommonTextField(
                  controller: controller.emailId,
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  label: 'Email Id',
                  isRequiredField: true,
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icon(Icons.email_rounded,
                      color: ColorHelper.hsBlack, size: 20),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter a email';
                    }
                    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                      return 'email id must contain at least one special character';
                    }
                    return null;
                  },
                ),
                CommonTextField(
                  controller: controller.pharmacyName,
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  label: 'Pharmacy name',
                  isRequiredField: true,
                  prefixIcon: Icon(Icons.person_pin,
                      color: ColorHelper.hsBlack, size: 20),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Pharmacy name';
                    }
                    return null;
                  },
                ),
                CommonTextField(
                  controller: controller.mobile,
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  label: 'Mobile no',
                  maxCharacters: 10,
                  keyboardType: TextInputType.phone,
                  isRequiredField: true,
                  prefixIcon: Icon(Icons.mobile_friendly,
                      color: ColorHelper.hsBlack, size: 20),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter mobile number';
                    }
                    return null;
                  },
                ),
                Obx(
                  () => CommonDropdownSearch(
                    suffixIcon: controller.stateLoading.value
                        ? Container(
                            height: 15,
                            width: 15,
                            alignment: Alignment.center,
                            child:
                                const CircularProgressIndicator(strokeWidth: 2),
                          )
                        : null,
                    items: controller.stateList
                        .where((state) => state!.stateName != null)
                        .map((state) => state!.stateName!)
                        .toList(),
                    label: 'Select state',
                    onChanged: (value) => controller.onChangedState(value),
                    selectedItem: controller.selectedState.value == ''
                        ? null
                        : controller.selectedState.value,
                    isRequiredField: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Select a state';
                      }
                      return null;
                    },
                  ),
                ),
                Obx(
                  () => CommonDropdownSearch(
                    suffixIcon: controller.cityLoading.value
                        ? Container(
                            height: 15,
                            width: 15,
                            alignment: Alignment.center,
                            child:
                                const CircularProgressIndicator(strokeWidth: 2),
                          )
                        : null,
                    items: controller.cityList
                        .where((city) => city!.cityName != null)
                        .map((city) => city!.cityName!)
                        .toList(),
                    label: 'Select city',
                    onChanged: (value) => controller.onChangedCity(value),
                    selectedItem: controller.selectedCity.value == ''
                        ? null
                        : controller.selectedCity.value,
                    isRequiredField: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Select a city';
                      }
                      return null;
                    },
                  ),
                ),
                Obx(
                  () => CommonDropdownSearch(
                    suffixIcon: controller.branchLoading.value
                        ? Container(
                            height: 15,
                            width: 15,
                            alignment: Alignment.center,
                            child:
                                const CircularProgressIndicator(strokeWidth: 2),
                          )
                        : null,
                    items: controller.branchList
                        .map((branch) => branch!.branchName!)
                        .toList(),
                    label: 'Select branch',
                    onChanged: (value) => controller.onChangedBranch(value),
                    selectedItem: controller.selectedBranch.value == ''
                        ? null
                        : controller.selectedBranch.value,
                    isRequiredField: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Select a branch';
                      }
                      return null;
                    },
                  ),
                ),
                Obx(
                  () => CommonDropdownSearch(
                    suffixIcon: controller.areaLoading.value
                        ? Container(
                            height: 15,
                            width: 15,
                            alignment: Alignment.center,
                            child:
                                const CircularProgressIndicator(strokeWidth: 2),
                          )
                        : null,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    items: controller.areaList
                        .map((area) => area!.areaName!)
                        .toList(),
                    label: 'Select area',
                    onChanged: (value) => controller.onChangedArea(value),
                    selectedItem: controller.selectedArea.value == ''
                        ? null
                        : controller.selectedArea.value,
                    isRequiredField: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Select a area';
                      }
                      return null;
                    },
                  ),
                ),
                Obx(
                  () => CommonDropdown(
                    selectedValue: controller.selectedSales.value == ''
                        ? null
                        : controller.selectedSales.value,
                    label: 'Sales executive',
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    isRequiredField: true,
                    onChanged: (newValue) {
                      controller.showExecutive.value = true;
                      controller.selectedSales.value = newValue;
                      // Retrieve the selected executive using the ID
                      final selectedExecutive =
                          controller.salesExecutiveList.firstWhere(
                        (executive) => executive['id'].toString() == newValue,
                        orElse: () => null,
                      );
                      if (selectedExecutive != null) {
                        // final selectedId = selectedExecutive['id'].toString();
                        controller.selectedSalesMobileNo =
                            selectedExecutive['mobile_no'];
                      }
                      controller.seMobile.text =
                          controller.selectedSalesMobileNo;
                    },
                    items: controller.salesExecutiveList
                        .map((sales) => DropdownMenuItem(
                              value: sales['id'].toString(),
                              child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 1.45,
                                  child: Text(
                                      "${sales['name']} - ${sales['mobile_no']}")),
                            ))
                        .toList(),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Select a sales executive';
                      }
                      return null;
                    },
                  ),
                ),
                CommonTextField(
                  controller: controller.pincode,
                  label: 'Pincode',
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  maxCharacters: 6,
                  keyboardType: TextInputType.number,
                  prefixIcon: Icon(Icons.code_rounded,
                      color: ColorHelper.hsBlack, size: 20),
                ),
                CommonFilePickerTile(
                  label: 'Aadhaar card front',
                  file: controller.aadhaarCardFFile,
                ),
                CommonFilePickerTile(
                  label: 'Aadhaar card back',
                  file: controller.aadhaarCardBFile,
                ),
                CommonTextField(
                  controller: controller.address,
                  label: 'Address',
                  isRequiredField: true,
                  minLines: 1,
                  maxLines: 4,
                  prefixIcon: Icon(Icons.location_city,
                      color: ColorHelper.hsBlack, size: 20),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter address';
                    }
                    return null;
                  },
                ),
                CommonFilePickerTile(
                  label: 'Address proof',
                  file: controller.addressFile,
                ),
                CommonTextField(
                  controller: controller.panCardNo,
                  label: 'Pan Card Number',
                  isRequiredField: true,
                  maxCharacters: 10,
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  prefixIcon: Icon(Icons.numbers_rounded,
                      color: ColorHelper.hsBlack, size: 20),
                  validator: (value) => ValidatorHelper.validatePANCard(value),
                ),
                CommonFilePickerTile(
                  label: 'PAN card',
                  file: controller.panCardFile,
                ),
                CommonTextField(
                  controller: controller.gstNo,
                  label: 'GST number',
                  maxCharacters: 15,
                  textCapitalization: TextCapitalization.characters,
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  prefixIcon: Icon(Icons.confirmation_number_rounded,
                      color: ColorHelper.hsBlack, size: 20),
                  validator: (value) {
                    if (value?.length != 15) {
                      return 'Enter must be 15 characters long';
                    }
                    return null;
                  },
                ),
                CommonFilePickerTile(
                  label: 'GST image',
                  file: controller.gstFile,
                ),
                CommonTextField(
                  controller: controller.bankName,
                  label: 'Bank name',
                  isRequiredField: true,
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  prefixIcon: Icon(Icons.account_balance_rounded,
                      color: ColorHelper.hsBlack, size: 20),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter bank name';
                    }
                    return null;
                  },
                ),
                CommonTextField(
                  controller: controller.ifscCode,
                  label: 'IFSC code',
                  isRequiredField: true,
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  prefixIcon: Icon(Icons.code_rounded,
                      color: ColorHelper.hsBlack, size: 20),
                  validator: (value) => ValidatorHelper.validateIFSC(value),
                  maxCharacters: 11,
                ),
                CommonFilePickerTile(
                  label: 'Cheque image',
                  file: controller.chequeFile,
                ),
                CommonTextField(
                  controller: controller.beneficiaryName,
                  label: 'Beneficiary name as par cheque',
                  isRequiredField: true,
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  prefixIcon: Icon(Icons.account_balance_outlined,
                      color: ColorHelper.hsBlack, size: 20),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter beneficiary name';
                    }
                    return null;
                  },
                ),
                CommonTextField(
                  controller: controller.accountNo,
                  label: 'Account number',
                  isRequiredField: true,
                  keyboardType: TextInputType.number,
                  maxCharacters: 20,
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  prefixIcon: Icon(Icons.account_balance_wallet_rounded,
                      color: ColorHelper.hsBlack, size: 20),
                  validator: (value) =>
                      ValidatorHelper.validateAccountNumber(value),
                ),
                Obx(
                  () => CommonTextField(
                    controller: controller.password,
                    label: 'Password',
                    isRequiredField: true,
                    obscureText: controller.obScured.value,
                    maxLines: 1,
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                    prefixIcon: Icon(Icons.lock_open_rounded,
                        color: ColorHelper.hsBlack, size: 20),
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
                      if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                        return 'Password must contain at least one special character';
                      }
                      return null;
                    },
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
                ),
                Obx(
                  () => CommonTextField(
                    controller: controller.cPassword,
                    label: 'Confirm password',
                    isRequiredField: true,
                    obscureText: controller.obCScured.value,
                    maxLines: 1,
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                    prefixIcon: Icon(Icons.lock_open_rounded,
                        color: ColorHelper.hsBlack, size: 20),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter a confirm password';
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
                      if (value != controller.password.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
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
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: <Widget>[
                      Obx(
                        () => Checkbox(
                          value: controller.agreedToTOS.value,
                          onChanged: controller.setAgreedToTOS,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => controller
                            .setAgreedToTOS(!controller.agreedToTOS.value),
                        child: const Text(
                          'I agree to the Terms of Condition and \nPrivacy Policy',
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: InkWell(
                    onTap: () async {
                      if (controller.signupFormKey.currentState!.validate()) {
                        // FocusScope.of(context).unfocus();
                        if (controller.selectedState.value == '' ||
                            controller.selectedCity.value == '' ||
                            controller.selectedArea.value == '') {
                          SnackBarHelper.getWarningMsg(
                              'Please select location fields');
                        } else if (controller.aadhaarCardFFile.value == null) {
                          SnackBarHelper.getWarningMsg(
                              AppTextHelper.aadhaarCardFSelect);
                        } else if (controller.aadhaarCardBFile.value == null) {
                          SnackBarHelper.getWarningMsg(
                              AppTextHelper.aadhaarCardBSelect);
                        } else if (controller.addressFile.value == null) {
                          SnackBarHelper.getWarningMsg(
                              AppTextHelper.addressSelect);
                        } else if (controller.panCardFile.value == null) {
                          log('${controller.panCardFile.value}');
                          SnackBarHelper.getWarningMsg(
                              AppTextHelper.panCardSelect);
                        } else if (controller.chequeFile.value == null) {
                          SnackBarHelper.getWarningMsg(
                              AppTextHelper.chequeImgSelect);
                        } else if (controller.agreedToTOS.value == false) {
                          SnackBarHelper.getWarningMsg(
                              'Please select term & condition');
                        } else {
                          // setState(() {
                          //   isSigningUp = true;
                          // });
                          // await signUpData();
                          // setState(() {
                          //   isSigningUp = false;
                          // });
                          controller.signUpData();
                        }
                      }
                    },
                    child: Obx(
                      () => Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: ColorHelper.hsBlack),
                        alignment: Alignment.center,
                        child: controller.isSigningUp.value == true
                            ? Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Processing : ${controller.loadingProgress.toStringAsFixed(1)}%',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  const SizedBox(width: 15),
                                  const CircularProgressIndicator(
                                      color: Colors.white),
                                ],
                              ) // Show loading indicator
                            : const Text(
                                "Create an account",
                                style: TextStyle(
                                  fontFamily: FontHelper.montserratMedium,
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: space),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
