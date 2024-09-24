import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/font_&_color_helper.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../App Helper/loading_helper.dart';
import 'Controller/contact_us_controller.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ContactUsController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: ColorHelper.hsPrimeOne,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: const [
          Text(
            "Contact Us",
            style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontFamily: FontHelper.montserratMedium,
                letterSpacing: 1),
          ),
          SizedBox(width: 10)
        ],
      ),
      body: SafeArea(
          child: Obx(
        () => controller.isLoading.value == false
            ? Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                    child: Container(
                      color: Colors.white,
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: InkWell(
                              onTap: () => launchUrl(Uri.parse(
                                  "tel://${controller.salesPersonNo}")),
                              child: Container(
                                width: MediaQuery.of(context).size.width / 1.3,
                                padding:
                                    const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${controller.salesPersonNM ?? 'N/A'}",
                                      style: TextStyle(
                                          fontFamily:
                                              FontHelper.montserratMedium,
                                          color: ColorHelper.hsPrime,
                                          fontSize: 16,
                                          letterSpacing: 0.5),
                                    ),
                                    Text("${controller.salesPersonNo ?? 'N/A'}",
                                        style: TextStyle(
                                            fontFamily:
                                                FontHelper.montserratRegular,
                                            color: ColorHelper.hsPrime,
                                            fontSize: 14,
                                            letterSpacing: 0.5)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: ColorHelper.hsPrimeOne,
                            child: const Icon(
                              Icons.call,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                    child: Container(
                      color: Colors.white,
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: InkWell(
                              onTap: () => launchUrl(
                                  Uri.parse("tel://${controller.superiorNo}")),
                              child: Container(
                                width: MediaQuery.of(context).size.width / 1.3,
                                padding:
                                    const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${controller.superiorNM ?? 'N/A'}",
                                      style: TextStyle(
                                          fontFamily:
                                              FontHelper.montserratMedium,
                                          color: ColorHelper.hsPrime,
                                          fontSize: 16,
                                          letterSpacing: 0.5),
                                    ),
                                    Text(
                                        "${controller.superiorNo ?? 'N/A'}",
                                        style: TextStyle(
                                            fontFamily:
                                                FontHelper.montserratRegular,
                                            color: ColorHelper.hsPrime,
                                            fontSize: 14,
                                            letterSpacing: 0.5)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: ColorHelper.hsPrimeOne,
                            child: const Icon(
                              Icons.call,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                    child: Container(
                      color: Colors.white,
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: InkWell(
                              onTap: () => launchUrl(Uri.parse(
                                  "tel://${controller.customerCareNo}")),
                              child: Container(
                                width: MediaQuery.of(context).size.width / 1.3,
                                padding:
                                    const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${controller.customerCareNm ?? 'N/A'}",
                                      style: TextStyle(
                                          fontFamily:
                                              FontHelper.montserratMedium,
                                          color: ColorHelper.hsPrime,
                                          fontSize: 16,
                                          letterSpacing: 0.5),
                                    ),
                                    Text(
                                        "${controller.customerCareNo ?? 'N/A'}",
                                        style: TextStyle(
                                            fontFamily:
                                                FontHelper.montserratRegular,
                                            color: ColorHelper.hsPrime,
                                            fontSize: 14,
                                            letterSpacing: 0.5)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: ColorHelper.hsPrimeOne,
                            child: const Icon(
                              Icons.call,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            : const CenterLoading(),
      )),
    );
  }
}
