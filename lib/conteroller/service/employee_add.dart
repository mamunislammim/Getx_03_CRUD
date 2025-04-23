import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:getx_02_crud_operation/conteroller/service/api_urls.dart';
import 'package:http/http.dart' as http;
import '../../utils/common_fun/local_storage.dart';

class EmployeeAddService {
  static Future<bool> service({required Map<String, dynamic> data}) async {
    try {
      var token = await LocalStorage().getData(key: "token");
      Uri uri = Uri.parse(ApiUrls.addEmployeeUrl);
      var header = {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      };
      var res = await http.post(uri, body: jsonEncode(data), headers: header);

      log("===============${res.statusCode}");
      log("===============${res.body}");
      if (res.statusCode == 200) {
        log("========Success=============");
        //Get.snackbar("Success", "Congratulations!!,, Your account are created..");
        return true;
      } else if (res.statusCode == 401) {
        Get.snackbar("Token Expire", "Please Login Again");
        return false;
      } else if (res.statusCode == 422) {
        var decodeData = jsonDecode(res.body);
        log("decodeData");
        Get.snackbar("Duplicate Data", "${decodeData['message']}");
        return false;
      }
    } catch (e) {
      log("Error : $e");
    }
    Get.snackbar("Error", "Something went wrong.");
    return false;
  }
}
