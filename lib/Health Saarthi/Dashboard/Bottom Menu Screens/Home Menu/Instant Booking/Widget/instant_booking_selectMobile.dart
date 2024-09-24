
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../App Helper/Model Helper/Cart Menu/mobile_number_model.dart';
import '../../../../../App Helper/font_&_color_helper.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import '../Controller/instant_booking_controller.dart';

class InstantBookingsSelectMobile extends StatelessWidget {
  const InstantBookingsSelectMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<InstantBookingController>();
    return Container(
        height: 48,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
        child: TypeAheadFormField<MobileData>(
          textFieldConfiguration: TextFieldConfiguration(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 10),
              //labelText: 'Select mobile number',
              label: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Select mobile number"),
                  Text(" *", style: TextStyle(color: Colors.red)),
                ],
              ),
              prefixIcon: const Icon(Icons.numbers),
              border: const OutlineInputBorder(),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black.withOpacity(0.5)),
              ),
              labelStyle: const TextStyle(
                color: Colors.black54,
                fontFamily: FontHelper.montserratRegular,
                fontSize: 14,
              ),
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            style: const TextStyle(
              fontFamily: FontHelper.montserratMedium,
              fontSize: 15,
              letterSpacing: 1,
              color: Colors.black87,
            ),
            controller: controller.pMobile, // Assign the controller
          ),
          suggestionsCallback: (pattern) async {
            if (controller.isTyping.value) {
              return controller.mobileList.where((item) =>
                  item.mobileNo!.toLowerCase().contains(pattern.toLowerCase()));
            } else {
              if (controller.pMobile.text.isNotEmpty) {
                return controller.mobileList.where((item) => item.mobileNo!
                    .toLowerCase()
                    .contains(pattern.toLowerCase()));
              } else {
                return [];
              }
            }
          },
          itemBuilder: (context, MobileData suggestion) {
            return ListTile(
              title: Text(
                "${suggestion.mobileNo!}  - ${suggestion.name}",
                style:
                    const TextStyle(fontFamily: FontHelper.montserratRegular),
              ),
            );
          },
          onSuggestionSelected: (MobileData suggestion) {
            controller.selectedMobileNumber.value =
                suggestion.encPharmacyPatientId;
            controller.getPatient(controller.selectedMobileNumber.value);
            controller.pMobile.text = suggestion
                .mobileNo!; // Assign the selected mobile number to the controller's text property
            controller.isTyping.value = true;
          },
          validator: (value) {
            if (value == null) {
              return 'Select a mobile number';
            }
            return null;
          },
          onSaved: (value) => controller.selectedMobileNumber.value = value!,
        ));
  }
}
