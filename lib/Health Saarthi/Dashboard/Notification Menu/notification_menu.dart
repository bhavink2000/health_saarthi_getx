import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/font_&_color_helper.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/loading_helper.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/Dashboard/Notification%20Menu/Controller/notification_controller.dart';

class NotificationMenu extends StatelessWidget {
  const NotificationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotificationController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: const [
          Text(
            "Notification",
            style: TextStyle(
                fontFamily: FontHelper.montserratMedium,
                fontSize: 16,
                letterSpacing: 0.5),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Obx(() => controller.notificationLoading.value
            ? const Center(
                child: CenterLoading(),
              )
            : controller.notificationModel.value.data!.isEmpty
                ? const Center(
                    child: Text("Notification is not available"),
                  )
                : ListView.builder(
                    itemCount: controller.notificationModel.value.data?.length,
                    itemBuilder: (context, index) {
                      var notiFi =
                          controller.notificationModel.value.data?[index];
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(5),
                                              topRight: Radius.circular(5),
                                            ),
                                            color: ColorHelper.hsPrime),
                                        //width: MediaQuery.of(context).size.width.w,
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 8, 0, 8),
                                          child: Text('${notiFi?.title}',
                                              style: const TextStyle(
                                                  fontFamily: FontHelper
                                                      .montserratRegular,
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 8, 10, 8),
                                  child: Text(
                                    '${notiFi?.message ?? 'N/A'}',
                                    style: const TextStyle(
                                        fontFamily:
                                            FontHelper.montserratRegular,
                                        fontSize: 12),
                                  ),
                                ),
                                Row(
                                  children: [
                                    const Spacer(),
                                    Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 5, 10, 5),
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                              bottomLeft: Radius.circular(0),
                                              topLeft: Radius.circular(5),
                                              bottomRight: Radius.circular(5)),
                                          color: ColorHelper.hsPrime),
                                      child: Text(
                                        '${notiFi?.createAt}',
                                        style: const TextStyle(
                                            fontFamily:
                                                FontHelper.montserratRegular,
                                            color: Colors.white,
                                            fontSize: 12),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  )),
      ),
    );
  }
}
