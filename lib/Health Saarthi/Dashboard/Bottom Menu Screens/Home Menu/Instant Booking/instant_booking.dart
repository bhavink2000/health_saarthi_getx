import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Widget%20Helper/common_appbar.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Widget%20Helper/common_text_field.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Widget%20Helper/gender_selection_widget.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/font_&_color_helper.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/snakebar_helper.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/Dashboard/Bottom%20Menu%20Screens/Home%20Menu/Instant%20Booking/Controller/instant_booking_controller.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/Dashboard/Bottom%20Menu%20Screens/Home%20Menu/Instant%20Booking/Widget/instant_booking_selectMobile.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../App Helper/Widget Helper/Common Location Picker/common_location_picker.dart';
import '../../../../App Helper/app_text_helper.dart';

class InstantBooking extends StatelessWidget {
  final bool isFromHome;
  const InstantBooking({super.key, this.isFromHome = false});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(InstantBookingController());
    return Scaffold(
      appBar: isFromHome ? null : commonAppbar('Instant Booking'),
      backgroundColor: Colors.white,
      body: Form(
        key: controller.instantBookingFormKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 5),
                const InstantBookingsSelectMobile(),
                CommonTextField(
                  label: 'Patient name',
                  controller: controller.pName,
                  prefixIcon: const Icon(Icons.person),
                  isRequiredField: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter patient name';
                    }
                    return null;
                  },
                ),
                CommonTextField(
                  label: 'Age',
                  controller: controller.pAge,
                  maxCharacters: 3,
                  prefixIcon: const Icon(Icons.view_agenda_rounded),
                  keyboardType: TextInputType.number,
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value != '') {
                      if (int.parse(value) > 120) {
                        return 'You can not enter age above 120';
                      }
                    }
                    return null;
                  },
                ),
                CommonTextField(
                  label: 'Email id',
                  controller: controller.emailId,
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  prefixIcon: const Icon(Icons.email),
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      if (!value.contains('@')) {
                        return 'Email id must contain "@" symbol';
                      }
                    }
                    return null;
                  },
                ),
                const CommonTextField(
                  label: 'Address',
                  prefixIcon: Icon(Icons.location_city_rounded),
                ),
                GenderSelectionWidget(
                  groupValue: controller.selectedGender,
                ),
                const CommonLocationPicker(),
                CommonTextField(
                  label: 'Collection date',
                  controller: controller.collectionDate,
                  prefixIcon: const Icon(Icons.date_range_rounded),
                ),
                CommonTextField(
                  label: 'Remark',
                  controller: controller.remark,
                  prefixIcon: const Icon(Icons.note_add_rounded),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: InkWell(
                      onTap: () async {
                        if (controller.userStatus.value == 0) {
                          SnackBarHelper.getWarningMsg(AppTextHelper.inAccount);
                        } else if (controller.userStatus.value == 1) {
                          if (controller.pName.text.isEmpty) {
                            SnackBarHelper.getWarningMsg(
                                AppTextHelper.patientName);
                          } else if (controller.pMobile.text.isEmpty) {
                            SnackBarHelper.getWarningMsg(
                                AppTextHelper.patientMobile);
                          } else if (controller
                                  .locationController.selectedState.value ==
                              '') {
                            SnackBarHelper.getWarningMsg(
                                AppTextHelper.selectState);
                          } else if (controller
                                  .locationController.selectedCity.value ==
                              '') {
                            SnackBarHelper.getWarningMsg(
                                AppTextHelper.selectCity);
                          } else if (controller
                                  .locationController.selectedArea.value ==
                              '') {
                            SnackBarHelper.getWarningMsg(
                                AppTextHelper.selectArea);
                          } else if (controller
                                  .locationController.selectedBranch.value ==
                              '') {
                            SnackBarHelper.getWarningMsg(
                                AppTextHelper.selectBranch);
                          } else {
                            await controller.instantBooking();
                          }
                        } else {
                          SnackBarHelper.getWarningMsg(
                              AppTextHelper.userNotFound);
                        }
                      },
                      child: Obx(
                        () => controller.instantBookingLoading.value
                            ? Shimmer.fromColors(
                                baseColor: ColorHelper.hsPrime,
                                period: const Duration(milliseconds: 500),
                                highlightColor: Colors.white.withOpacity(0.6),
                                child: Container(
                                  width: Get.width,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: ColorHelper.hsPrime),
                                ))
                            : Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: ColorHelper.hsPrime),
                                child: const Text("Confirm Booking",
                                    style: TextStyle(
                                        fontFamily:
                                            FontHelper.montserratRegular,
                                        color: Colors.white,
                                        fontSize: 18,
                                        letterSpacing: 1)),
                              ),
                      )),
                ),
                isFromHome ? const SizedBox(height: 70) : Container()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
