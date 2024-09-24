import 'dart:developer';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/font_&_color_helper.dart';
import 'package:image_picker/image_picker.dart';

class FileImagePicker extends GetxController {
  Future<File?> pickFileManager() async {
    try {
      final pickedFile = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowMultiple: false,
        allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
      );
      if (pickedFile == null) {
        // ScaffoldMessenger.of(context).showSnackBar(
        //   const SnackBar(
        //     content: Text('No file choose'),
        //   ),
        // );
        Get.rawSnackbar(
            message: 'No file choose',
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

  Future<List<File>?> pickPrescription() async {
    try {
      final pickedFiles = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowMultiple: true,
        allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
      );
      if (pickedFiles == null || pickedFiles.files.isEmpty) {
        //GetXSnackBarMsg.getWarningMsg('No file chosen');
        return null;
      }
      final originalFiles =
          pickedFiles.files.map((file) => File(file.path!)).toList();
      return originalFiles;
    } on PlatformException catch (e) {
      log("PlatformException -> $e");
      return null;
    } catch (e) {
      log("Error -> $e");
      return null;
    }
  }

  Future<File?> pickCamera() async {
    try {
      final pickedFile = await ImagePicker()
          .pickImage(source: ImageSource.camera, imageQuality: 25);
      if (pickedFile == null) {
        Get.rawSnackbar(
            message: 'No file choose',
            icon: const Icon(Icons.warning_amber, color: Colors.white),
            backgroundColor: ColorHelper.hsBlack);
        return null;
      }
      final file = File(pickedFile.path);
      final fileSize = file.lengthSync();
      log("pick camera img size->${formatBytes(fileSize)}");
      return file;
    } on PlatformException catch (e) {
      log("platForm-> $e");
    } catch (e) {
      log("error -> $e");
    }
    return null;
  }

  String formatBytes(int bytes) {
    double kb = bytes / 1024;
    return '${kb.toStringAsFixed(2)} KB';
  }
}
