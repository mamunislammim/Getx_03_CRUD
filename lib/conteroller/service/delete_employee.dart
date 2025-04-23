import 'dart:developer';
import 'package:get/get.dart';
import 'package:getx_02_crud_operation/conteroller/service/api_urls.dart';
import 'package:http/http.dart' as http;
import '../../utils/common_fun/local_storage.dart';

class EmployeeDeleteService {
  static Future<bool> service({required int id}) async {
    try {
      var token = await LocalStorage().getData(key: "token");
      Uri uri = Uri.parse("${ApiUrls.deleteEmployeeUrl}/$id");
      var header = {"Accept": "application/json", "Authorization": "Bearer $token"};
      var response = await http.get(uri, headers: header);

      if (response.statusCode == 200) {
        Get.snackbar("Success", "Employee Successfully Deleted.");
        return true;
      } else if (response.statusCode == 401) {
        Get.snackbar("Token Expire", "Please Login Again");
        return false;
      }
    } catch (e) {
      log("Error:  $e");
    }
    Get.snackbar("Error", "Wrong");
    return false;
  }
}
