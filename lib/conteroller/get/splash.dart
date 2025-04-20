import 'dart:developer';

import 'package:get/get.dart';
import 'package:getx_02_crud_operation/utils/common_fun/local_storage.dart';
import 'package:getx_02_crud_operation/view/screen/employee/view.dart';
import '../../view/screen/login/login.dart';

class SplashController extends GetxController {
  navigateFunction() async {
    log("=====================Get Token=============");
    var a = await LocalStorage().getData(key: "token");

    log("=====================Get Token : $a=============");

    if (a == "") {
      await Future.delayed(const Duration(seconds: 2)).then((v) => Get.offAll(LoginScreen()));
    } else {
      await Future.delayed(const Duration(seconds: 2)).then((v) => Get.offAll(EmployeeView()));
    }
  }

  @override
  void onInit() {
    navigateFunction();
    super.onInit();
  }
}
