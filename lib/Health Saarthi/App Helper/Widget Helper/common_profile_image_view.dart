import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/Dashboard/Bottom%20Menu%20Screens/Profile%20Menu/Controller/profile_controller.dart';

import '../file_picker_helper.dart';
import '../font_&_color_helper.dart';

class CommonProfileImageView extends StatelessWidget {
  final String label;
  final String? fileName;
  final String? imageUrl;
  final Rxn<File> file;
  const CommonProfileImageView({
    super.key,
    required this.label,
    this.fileName,
    this.imageUrl,
    required this.file,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();
    return Container(
      width: Get.width,
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black.withOpacity(0.5),
          ),
          borderRadius: BorderRadius.circular(5)),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 10),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label),
            Obx(
              () => Text(
                file.value == null ? '$fileName' : '$label is picked.',
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 12,
                  color:
                      file.value == null ? Colors.black87 : ColorHelper.hsPrime,
                ),
              ),
            )
          ],
        ),
        trailing: SizedBox(
          width: 110,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text("View",
                  style: TextStyle(fontFamily: FontHelper.montserratRegular)),
              const SizedBox(width: 5),
              Obx(() => controller.userStatus.value == 0
                  ? InkWell(
                      onTap: () async {
                        var panCardCamera =
                            await FileImagePicker().pickCamera();
                        file.value = panCardCamera!;
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 5),
                        child: const Text("Upload",
                            style: TextStyle(
                                fontFamily: FontHelper.montserratRegular)),
                      ))
                  : Container())
            ],
          ),
        ),
        children: [
          imageUrl == 'null'
              ? const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Image not found"),
                )
              : Image.network(
                  '$imageUrl',
                  fit: BoxFit.fill,
                  loadingBuilder: (BuildContext? context, Widget? child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child!;
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      ),
                    );
                  },
                ),
        ],
      ),
    );
  }
}
