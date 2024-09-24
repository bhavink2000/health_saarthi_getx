import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Netwok%20Helper/api_url_helper.dart';
import 'package:http/http.dart' as http;
import '../../Model Helper/Dashboard Model/profile_model.dart';

class ProfileFuture {
  Future<ProfileModel> fetchProfile() async {
    final box = GetStorage();
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${box.read('accessToken')}',
    };
    var response = await http.get(
      Uri.parse(ApiHelper.profileUrls),
      headers: headers,
    );
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      if (jsonResponse['status'] == '402') {
        throw Exception(jsonResponse);
      } else {
        return ProfileModel.fromJson(jsonResponse);
      }
    } else {
      throw Exception('Request failed with status: ${response.statusCode}.');
    }
  }
}
