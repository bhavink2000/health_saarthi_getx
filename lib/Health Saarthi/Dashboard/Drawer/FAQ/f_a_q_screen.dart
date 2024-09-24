import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/font_&_color_helper.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/loading_helper.dart';
import 'Controller/f_a_q_controller.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FAQController());
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: ColorHelper.hsPrime,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: const [
          Text(
            "FAQ",
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
      body: Obx(() => controller.loading.value
          ? const CenterLoading()
          : controller.faqModel.value.data!.isNotEmpty
              ? ListView.builder(
                  itemCount: controller.faqModel.value.data!.length,
                  itemBuilder: (context, index) {
                    var faqs = controller.faqModel.value.data![index];
                    return ExpansionTile(
                      collapsedTextColor: ColorHelper.hsPrime,
                      tilePadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      backgroundColor: ColorHelper.hsPrime.withOpacity(0.1),
                      title: Text(
                        faqs.question!,
                        style: TextStyle(
                            fontFamily: FontHelper.montserratMedium,
                            color: ColorHelper.hsPrime),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              faqs.answer!,
                              style: const TextStyle(
                                  fontFamily: FontHelper.montserratLight,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                )
              : const Center(
                  child: Text('No data'),
                )),
    );
  }
}
