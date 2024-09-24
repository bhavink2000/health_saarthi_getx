import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Widget%20Helper/common_dropdown.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Widget%20Helper/common_text_field.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/font_&_color_helper.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

import 'Controller/support_controller.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SupportController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: ColorHelper.hsPrimeOne,
          iconTheme: const IconThemeData(color: Colors.white),
          actions: const [
            Text(
              "Support",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontFamily: FontHelper.montserratMedium,
                  letterSpacing: 1),
            ),
            SizedBox(width: 10)
          ]),
      body: SingleChildScrollView(
        child: Form(
          key: controller.supportFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: CommonTextField(
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                    controller: controller.fName,
                    label: 'First Name',
                    prefixIcon:
                        const Icon(Icons.person, color: Colors.black, size: 24),
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
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                    controller: controller.mobile,
                    keyboardType: TextInputType.phone,
                    label: 'Mobile Number',
                    maxCharacters: 10,
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
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: CommonTextField(
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  controller: controller.email,
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
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                child: CommonDropdown(
                  label: 'Select option',
                  selectedValue: controller.dropdownValue.value == ''
                      ? null
                      : controller.dropdownValue.value,
                  onChanged: (newValue) {
                    controller.dropdownValue.value = newValue!;
                    log(newValue!.toString());
                    if (controller.dropdownValue.value == 'Complaint') {
                      controller.complain.value = true;
                      controller.help.value = false;
                      controller.rating.value = false;
                      controller.reason.value = false;
                    } else if (controller.dropdownValue.value == 'Help') {
                      controller.complain.value = false;
                      controller.rating.value = false;
                      controller.reason.value = false;
                      controller.help.value = true;
                    } else if (controller.dropdownValue.value == 'Reason') {
                      controller.rating.value = false;
                      controller.help.value = false;
                      controller.reason.value = true;
                      controller.complain.value = false;
                    } else {
                      controller.complain.value = false;
                      controller.help.value = false;
                      controller.rating.value = true;
                      controller.reason.value = false;
                    }
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  items: <String>['Complaint', 'Rating', 'Help', 'Reason']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              Obx(
                () => Visibility(
                  visible: controller.complain.value,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: Column(
                      children: [
                        TextFormField(
                            controller: controller.message,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Write Message',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter message';
                              }
                              return null;
                            }),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                controller.fName.clear();
                                controller.mobile.clear();
                                controller.email.clear();
                                controller.message.clear();
                                Get.back();
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.fromLTRB(12, 8, 12, 8),
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
                                if (controller.supportFormKey.currentState!
                                    .validate()) {
                                  controller.sendSupport();
                                }
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.fromLTRB(12, 8, 12, 8),
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
              Obx(
                () => Visibility(
                  visible: controller.help.value,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: Column(
                      children: [
                        TextFormField(
                            controller: controller.message,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Write Message',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter message';
                              }
                              return null;
                            }),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                controller.fName.clear();
                                controller.mobile.clear();
                                controller.email.clear();
                                controller.message.clear();
                                Get.back();
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.fromLTRB(12, 8, 12, 8),
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
                                if (controller.supportFormKey.currentState!
                                    .validate()) {
                                  controller.sendSupport();
                                }
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.fromLTRB(12, 8, 12, 8),
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
              Obx(
                () => Visibility(
                  visible: controller.rating.value,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: Column(
                      children: [
                        TextFormField(
                            controller: controller.message,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Write Message',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter message';
                              }
                              return null;
                            }),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                SmoothStarRating(
                                  rating: controller.ratingValue.value,
                                  color: ColorHelper.hsPrimeOne,
                                  borderColor: ColorHelper.hsPrime,
                                  size: 45,
                                  starCount: 5,
                                  onRatingChanged: (value) {
                                    controller.ratingValue.value = value;
                                    log("Rating->${controller.ratingValue.value}");
                                  },
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                if (controller.supportFormKey.currentState!
                                    .validate()) {
                                  controller.sendSupport();
                                }
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.fromLTRB(12, 8, 12, 8),
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
              Obx(
                () => Visibility(
                  visible: controller.reason.value,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            //height: MediaQuery.of(context).size.height / 15,
                            child: DropdownButtonFormField<String>(
                              value: controller.reasonValue?.value,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              style: const TextStyle(
                                  fontSize: 10, color: Colors.black87),
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(
                                    PaddingHelper.hsPaddingM),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                hintText: 'Select option',
                                hintStyle: const TextStyle(
                                  color: Colors.black54,
                                  fontFamily: FontHelper.montserratRegular,
                                  fontSize: 12,
                                ),
                              ),
                              onChanged: (newValue) {
                                controller.reasonValue?.value = newValue!;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please select option';
                                }
                                return null;
                              },
                              items: <String>[
                                'Payment',
                                'Booking'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        TextFormField(
                            controller: controller.message,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Write Description',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter description';
                              }
                              return null;
                            }),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                controller.message.clear();
                                Get.back();
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.fromLTRB(12, 8, 12, 8),
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
                                if (controller.supportFormKey.currentState!
                                    .validate()) {
                                  controller.sendSupport();
                                }
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.fromLTRB(12, 8, 12, 8),
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
            ],
          ),
        ),
      ),
    );
  }
}
