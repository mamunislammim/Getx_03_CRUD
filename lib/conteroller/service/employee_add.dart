import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:getx_02_crud_operation/conteroller/service/api_urls.dart';
import 'package:http/http.dart' as http;
import '../../utils/common_fun/local_storage.dart';

class EmployeeAddService {
  //======================= Image ================================

  static Future<bool> serviceWithImage({required Map<String, dynamic> data}) async {
    try {
      var token = await LocalStorage().getData(key: "token");
      Uri uri = Uri.parse(ApiUrls.addEmployeeUrl);
      var req = http.MultipartRequest("POST", uri);
      req.fields['name'] = data['name'];
      req.fields['phone'] = data['phone'];
      req.fields['email'] = data['email'];
      req.fields['join_date'] = data['join_date'];
      req.fields['designation'] = data['designation'];
      req.fields['address'] = data['address'];
      req.fields['roles'] = data['roles'];
      req.fields['expertise_in'] = data['expertise_in'];
      req.headers['Content-Type'] = "application/json";
      req.headers['Accept'] = "application/json";
      req.headers['Authorization'] = "Bearer $token";

      if (data['image'] != null) {
        req.files.add(await http.MultipartFile.fromPath('image', "${data['image'].path}"));
      }

      var response = await req.send();

      log("======${response.statusCode}=================");
      log("======${await response.stream.bytesToString()}=================");
      if (response.statusCode == 200) {
        log("========Success=============");
        //Get.snackbar("Success", "Congratulations!!,, Your account are created..");
        return true;
      } else if (response.statusCode == 401) {
        Get.snackbar("Token Expire", "Please Login Again");
        return false;
      } else if (response.statusCode == 422) {
        var decodeData = jsonDecode(await response.stream.bytesToString());
        log("decodeData");
        Get.snackbar("Duplicate Data", "${decodeData['message']}");
        return false;
      }
    } catch (e) {
      log("======== Error : $e");
    }
    return false;
  }

  ///===============================================================

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
