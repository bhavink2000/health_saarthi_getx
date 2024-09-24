import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../App Helper/file_picker_helper.dart';
import '../../../../../App Helper/font_&_color_helper.dart';
import '../Controller/attach_prescription_controller.dart';

class UploadPrescriptionWidget extends StatelessWidget {
  const UploadPrescriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AttachPrescriptionController>();
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          border: Border.all(color: Colors.black)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  "Upload prescription",
                  style: TextStyle(fontFamily: FontHelper.montserratMedium),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () async {
                    var prescriptionFileManager =
                        await FileImagePicker().pickPrescription();
                    controller.prescriptionFiles
                        .addAll(prescriptionFileManager!);
                  },
                  icon: const Icon(
                    Icons.file_copy_rounded,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    var prescriptionCamera =
                        await FileImagePicker().pickCamera();
                    controller.prescriptionFiles.add(prescriptionCamera!);
                  },
                  icon: const Icon(
                    Icons.camera_alt_rounded,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Obx(
              () => SizedBox(
                width: Get.width,
                height: Get.height / 20,
                child: controller.prescriptionFiles.isNotEmpty
                    ? ListView.builder(
                        itemCount: controller.prescriptionFiles.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            width: Get.width / 1.3,
                            margin: const EdgeInsets.fromLTRB(0, 0, 5, 5),
                            decoration: BoxDecoration(
                                color: ColorHelper.hsPrime,
                                borderRadius: BorderRadius.circular(5)),
                            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                            child: GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Dialog(
                                        child: Image.file(controller
                                            .prescriptionFiles[index]),
                                      );
                                    });
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: Get.width / 1.7,
                                    child: Text(
                                        controller.prescriptionFiles[index].path
                                            .split('/')
                                            .last,
                                        style: const TextStyle(
                                            fontFamily:
                                                FontHelper.montserratLight,
                                            color: Colors.white),
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                  const SizedBox(width: 10),
                                  IconButton(
                                      onPressed: () {
                                        controller.prescriptionFiles.remove(
                                            controller
                                                .prescriptionFiles[index]);
                                      },
                                      icon: const Icon(
                                        Icons.delete_rounded,
                                        color: Colors.white,
                                      ))
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    : const Center(
                        child: Text('No file chosen'),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
