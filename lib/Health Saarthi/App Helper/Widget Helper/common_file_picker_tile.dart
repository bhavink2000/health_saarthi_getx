import 'dart:developer';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../font_&_color_helper.dart';
import 'package:path/path.dart' as p;

// ignore: must_be_immutable
class CommonFilePickerTile extends StatelessWidget {
  // if you are using this declare variable like this :=> Rxn<File> fileName = Rxn<File>();
  final String label;
  Rxn<File> file;
  CommonFilePickerTile({
    super.key,
    required this.label,
    required this.file,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CommonFilePickerTileController());
    return Container(
      height: 48,
      width: Get.width,
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(5)),
      child: Obx(
        () => Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            file.value == null
                ? Text(
                    label,
                    style: const TextStyle(
                        fontFamily: FontHelper.montserratMedium),
                  )
                : Container(
                    alignment: Alignment.centerLeft,
                    width: p.extension(file.value!.path) == '.pdf' ||
                            p.extension(file.value!.path) == '.PDF'
                        ? 200
                        : 100,
                    height: 40,
                    child: p.extension(file.value!.path) == '.pdf' ||
                            p.extension(file.value!.path) == '.PDF'
                        ? Text(p.basename(file.value!.path))
                        : InkWell(
                            onTap: () {
                              if (file.value != null) {
                                Get.dialog(Dialog(
                                  child: Image.file(file.value!),
                                ));
                              }
                            },
                            child: file.value == null
                                ? Text(
                                    label,
                                    style: const TextStyle(
                                        fontFamily:
                                            FontHelper.montserratMedium),
                                  )
                                : Image.file(
                                    file.value!,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                  ),
            const Spacer(),
            IconButton(
                onPressed: () {
                  controller.pickFileManager().then((value) {
                    file.value = value;
                  });
                },
                icon: const Icon(Icons.file_copy_rounded)),
            IconButton(
                onPressed: () {
                  controller.pickCamera().then((value) {
                    file.value = value!;
                  });
                },
                icon: const Icon(Icons.camera_alt_rounded)),
          ],
        ),
      ),
    );
  }
}

class CommonFilePickerTileController extends GetxController {
  Future<File?> pickCamera() async {
    try {
      final pickedFile = await ImagePicker()
          .pickImage(source: ImageSource.camera, imageQuality: 25);
      if (pickedFile == null) {
        Get.rawSnackbar(
            message: 'No file chosen',
            icon: const Icon(Icons.warning_amber, color: Colors.white),
            backgroundColor: ColorHelper.hsBlack);
        return null;
      }
      final file = File(pickedFile.path);
      return file;
    } on PlatformException catch (e) {
      log("platForm-> $e");
    } catch (e) {
      log("error -> $e");
    }
    return null;
  }

  Future<File?> pickFileManager() async {
    try {
      final pickedFile = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowMultiple: false,
        allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
      );
      if (pickedFile == null) {
        Get.rawSnackbar(
            message: 'No file chosen',
            icon: const Icon(Icons.warning_amber, color: Colors.white),
            backgroundColor: ColorHelper.hsBlack);
        return null;
      }
      final originalFile = File(pickedFile.files.single.path!);
      log('in helper class $originalFile');
      return originalFile;
    } on PlatformException catch (e) {
      log("PlatformException -> $e");
      return null;
    } catch (e) {
      log("Error -> $e");
      return null;
    }
  }
}
