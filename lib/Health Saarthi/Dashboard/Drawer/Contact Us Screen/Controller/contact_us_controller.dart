import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Netwok%20Helper/api_url_helper.dart';

class ContactUsController extends GetxController {
  @override
  void onInit() {
    fetchContact();
    super.onInit();
  }
  var salesPersonNM,superiorNM,customerCareNm,otherNM;
  var salesPersonNo,superiorNo,customerCareNo,otherNo;
  RxBool isLoading = false.obs;
  void fetchContact() async {
      isLoading(true);
      final box = GetStorage();
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${box.read('accessToken')}',
    };
    final response = await http.get(
        headers: headers,
        Uri.parse(ApiHelper.contactUsUrls)
    );
    log("response-$response");
    if (response.statusCode == 200) {
      final data = json.decode(response.body)['data'];
      log("data->$data");
      if(data != null){
          salesPersonNM = data['name'];
          salesPersonNo = data['mobile_no'];
          superiorNM = data['name_two'];
          superiorNo = data['mobile_no_two'];
          customerCareNm = data['name_three'];
          customerCareNo = data['mobile_no_three'];
          otherNM = data['name_other'];
          otherNo = data['mobile_no_other'];
          isLoading(false);
        // final id = data['id'];
        // final status = data['status'];
        // final encId = data['enc_id'];
      }
      else{
          isLoading(false);
      }
    } else {
      log('Request failed with status: ${response.statusCode}');
    }
  }
}