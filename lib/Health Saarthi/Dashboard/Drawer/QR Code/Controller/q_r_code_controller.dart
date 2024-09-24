import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Device%20Information/device_information.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Model%20Helper/Drawer%20Menu/qr_code_model.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Netwok%20Helper/api_url_helper.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/snakebar_helper.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class QRCodeController extends GetxController {
  Rx<QRCodeModel> qrCodeModel = QRCodeModel().obs;

  @override
  void onInit() {
    getQRCodeData();
    super.onInit();
  }

  final box = GetStorage();

  RxBool isLoading = false.obs;
  Future<void> getQRCodeData() async {
    isLoading(true);
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${box.read('accessToken')}',
    };
    try {
      final response =
          await http.get(Uri.parse(ApiHelper.qrCodeUrl), headers: headers);
      final jsonData = json.decode(response.body);
      if (jsonData['status'] == '402') {
        DeviceInformation.logoutUser();
        SnackBarHelper.getWarningMsg('${jsonData['message']}');
        isLoading(false);
      } else {
        final jsonData = json.decode(response.body);
        qrCodeModel.value = QRCodeModel.fromJson(jsonData);
        isLoading(false);
      }
    } catch (e) {
      isLoading(false);
    }
  }

  RxDouble downloadProgress = 0.0.obs;
  RxBool showDownload = false.obs;
  Future downloadFile(var imgUrl) async {
    downloadProgress.value = 0.0;
    showDownload(true);
    Dio dio = Dio();
    String? imageDownloadPath;
    if (GetPlatform.isAndroid) {
      imageDownloadPath =
          '/storage/emulated/0/Download/hsQRCode_${Random().nextInt(10000)}.pdf';
    } else if (GetPlatform.isIOS) {
      var temp = await getTemporaryDirectory();
      imageDownloadPath =
          '${temp.path}/hsQRCode_${Random().nextInt(10000)}.pdf';
    }
    await dio.download(imgUrl, imageDownloadPath,
        onReceiveProgress: (received, total) {
      var progress = (received / total) * 100;
      downloadProgress.value = progress;
    });
    showDownload(false);
    downloadProgress.value = 0.0;
    return imageDownloadPath;
  }
}
