import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:getx_02_crud_operation/utils/common_fun/local_storage.dart';
import 'package:http/http.dart' as http;

class LoginRepository {
  static Future<bool> service({required String mail, required String password}) async {
    try {
      Uri uri = Uri.parse("https://flutter-batch3.advocate-portfolio.classicitltd.com/api/login");
      var response = await http.post(uri, body: {"email_phone": mail, "password": password});

      log("==========${mail}== ${password}================");

      log("=========${response.statusCode}===========");
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        var a = jsonData['token'];

        LocalStorage().addData(key: "token", value: a);
        LocalStorage().addData(key: "user_info", value: jsonEncode(jsonData['response_data']));
        Get.snackbar("Message", "Login Success");
        return true;
      } else if (response.statusCode == 401) {
        Get.snackbar("Message", "Wrong user");
        return false;
      } else if (response.statusCode == 404) {
        Get.snackbar("Message", "Contact with Admin");
        return false;
      }
    } catch (e) {
      log("Error : $e");
    }
    Get.snackbar("Message", "Something went wrong..!!");
    return false;
  }
}
