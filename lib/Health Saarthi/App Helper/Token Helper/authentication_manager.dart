import 'package:get_storage/get_storage.dart';

class AuthenticationManager {

  static Future<bool> saveToken(String? token) async {
    final box = GetStorage();
    await box.write('accessToken', token);
    return true;
  }

  static String? getToken() {
    final box = GetStorage();
    return box.read('accessToken');
  }

  static Future<void> removeToken() async {
    final box = GetStorage();
    await box.remove('accessToken');
  }

}
