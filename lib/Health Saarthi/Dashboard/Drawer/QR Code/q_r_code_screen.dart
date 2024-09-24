import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/font_&_color_helper.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/icon_helper.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/snakebar_helper.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/Dashboard/Drawer/QR%20Code/Controller/q_r_code_controller.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';

import '../../../App Helper/loading_helper.dart';

class QRCodeScreen extends StatelessWidget {
  const QRCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(QRCodeController());
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: ColorHelper.hsPrime,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: const [
          Text(
            "QR code",
            style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontFamily: FontHelper.montserratMedium,
                letterSpacing: 1),
          ),
          SizedBox(width: 10)
        ],
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20)),
              color: Colors.white),
          child: Obx(
            () => controller.isLoading.value == false
                ? SingleChildScrollView(
                    child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: Get.width,
                        color: ColorHelper.qrCodeColor,
                        margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Container(
                                width: Get.width / 1.2,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 2),
                                    borderRadius: BorderRadius.circular(10)),
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                margin:
                                    const EdgeInsets.fromLTRB(15, 12, 15, 5),
                                child: Column(
                                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const SizedBox(height: 30),
                                    const Text('F  U  L  L   B  O  D  Y',
                                        style: TextStyle(
                                            fontFamily:
                                                FontHelper.montserratRegular,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold)),
                                    const Divider(
                                        color: Colors.grey,
                                        thickness: 1,
                                        endIndent: 80,
                                        indent: 80),
                                    Text('CHECKUP AT HOME',
                                        style: TextStyle(
                                            fontFamily:
                                                FontHelper.montserratRegular,
                                            color: ColorHelper.hsPrime,
                                            fontWeight: FontWeight.bold)),
                                    const SizedBox(height: 10),
                                    Text(
                                        controller
                                                .qrCodeModel.value.data?.name ??
                                            'N/A',
                                        style: const TextStyle(
                                            fontFamily:
                                                FontHelper.montserratMedium,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                    const SizedBox(height: 3),
                                    Text(
                                        controller.qrCodeModel.value.data
                                                ?.mobile ??
                                            'N/A',
                                        style: const TextStyle(
                                            fontFamily:
                                                FontHelper.montserratMedium,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                    const SizedBox(height: 5),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 5, 10, 5),
                                      child: Stack(
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                0, 10, 0, 0),
                                            child: Image(
                                                image: AssetImage(
                                                    'assets/Drawer/qrboxbg.png'),
                                                width: 300),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                25, 10, 25, 10),
                                            child: controller
                                                        .qrCodeModel
                                                        .value
                                                        .data
                                                        ?.qrcodeImagePath ==
                                                    null
                                                ? Container()
                                                : Container(
                                                    padding:
                                                        const EdgeInsets.fromLTRB(
                                                            10, 10, 10, 10),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                10)),
                                                    child: Image(
                                                        image: NetworkImage(
                                                            '${controller.qrCodeModel.value.data?.qrcodeImagePath}'))),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Text(
                                      'Book Full Body Checkup',
                                      style: TextStyle(
                                          fontFamily:
                                              FontHelper.montserratRegular,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: ColorHelper.hsPrime,
                                      ),
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 5, 10, 5),
                                      child: RichText(
                                        text: TextSpan(
                                          children: [
                                            const TextSpan(
                                              text: 'Accuris B+',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            WidgetSpan(
                                              child: Transform.translate(
                                                offset: const Offset(2, -8),
                                                child: const Text(
                                                  've',
                                                  // textScaleFactor: 0.8,
                                                  textScaler:
                                                      TextScaler.linear(0.8),
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    const Text('With Health Sarthi',
                                        style: TextStyle(
                                            fontFamily:
                                                FontHelper.montserratMedium,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                    Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 10, 10, 10),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              bottomIconText(
                                                  IconHelper.qrImgOne,
                                                  'Authorized',
                                                  'Collection Center'),
                                              bottomIconText(
                                                  IconHelper.qrImgTwo,
                                                  'Cash & Digital',
                                                  'Payment options'),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              bottomIconText(
                                                  IconHelper.qrImgThree,
                                                  'Strict Safety and',
                                                  'Hygiene Measures'),
                                              bottomIconText(
                                                  IconHelper.qrImgFour,
                                                  'Reports via',
                                                  'Whatsapp & Email'),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Text(
                                      'All type Laboratory test \nfacility 24x7 (365 Day)',
                                      style: TextStyle(
                                          fontFamily:
                                              FontHelper.montserratRegular),
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                )),
                            Container(
                                color: ColorHelper.qrCodeColor,
                                padding:
                                    const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: const Image(
                                    image:
                                        AssetImage('assets/Drawer/applogo.png'),
                                    width: 130))
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () async {
                              var status = await Permission.storage.request();
                              if (status.isGranted) {
                                controller
                                    .downloadFile(
                                        controller.qrCodeModel.value.pdf)
                                    .catchError((onError) {
                                  debugPrint('Error downloading: $onError');
                                }).then((imagePath) {
                                  debugPrint(
                                      'Download successful, path: $imagePath');
                                  SnackBarHelper.getSuccessMsg(
                                      'Download path: $imagePath');
                                });
                              } else {
                                controller
                                    .downloadFile(
                                        controller.qrCodeModel.value.pdf)
                                    .catchError((onError) {
                                  debugPrint('Error downloading: $onError');
                                }).then((imagePath) {
                                  debugPrint(
                                      'Download successful, path: $imagePath');
                                  SnackBarHelper.getWarningMsg(
                                      'Download path: $imagePath');
                                });
                                log("status-$status");
                              }
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width / 2.5,
                              padding:
                                  const EdgeInsets.fromLTRB(20, 10, 20, 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: ColorHelper.hsPrime),
                              child: const Text(
                                'Download',
                                style: TextStyle(
                                    fontFamily: FontHelper.montserratMedium,
                                    color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              final response = await get(
                                  Uri.parse(controller.qrCodeModel.value.pdf!));
                              final directory = await getTemporaryDirectory();
                              File file =
                                  await File('${directory.path}/HSQRCode.pdf')
                                      .writeAsBytes(response.bodyBytes);
                              await Share.shareXFiles([XFile(file.path)],
                                  text: 'Share');
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width / 2.5,
                              padding:
                                  const EdgeInsets.fromLTRB(20, 10, 20, 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: ColorHelper.hsPrime),
                              child: const Text(
                                'Share',
                                style: TextStyle(
                                    fontFamily: FontHelper.montserratMedium,
                                    color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Obx(() => controller.showDownload.value == true
                          ? Center(
                              child: Text(
                                  'Downloading...${controller.downloadProgress.value.toString().split('.').first} %'),
                            )
                          : Container())
                    ],
                  ))
                : const CenterLoading(),
          )),
    );
  }

  Widget bottomIconText(var imgIcon, var textOne, var textTwo) {
    return SizedBox(
      width: Get.width / 2.7,
      child: Row(
        children: [
          Image(image: imgIcon, width: 30),
          const SizedBox(width: 5),
          Text(
            '$textOne\n$textTwo',
            style: const TextStyle(
                fontFamily: FontHelper.montserratRegular,
                fontSize: 10,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
