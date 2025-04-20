import 'dart:developer';
import 'package:getx_02_crud_operation/utils/common_fun/local_storage.dart';
import 'package:http/http.dart' as http;

class EmployeeService {
  static Future getService() async {
    try {
      var token = await LocalStorage().getData(key: "token");
      log("======${token}=================");
      Uri url = Uri.parse(
        "https://flutter-batch3.advocate-portfolio.classicitltd.com/api/employee",
      );

      var header = {"Accept": "application/json", "Authorization": "Bearer $token"};
      var response = await http.get(url, headers: header);

      log("=============== ${response.statusCode}============");
      log("=============== ${response.body}============");
      if (response.statusCode == 200) {
        log("================Gettttttttttttttttttt============");
      }
    } catch (e) {
      log("Error : $e");
    }
  }
}
