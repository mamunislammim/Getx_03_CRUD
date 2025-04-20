import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_02_crud_operation/view/screen/employee/view.dart';
import '../service/login.dart';

class LoginController extends GetxController {
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  loginFun({required String mail, required String password}) async {
    var status = await LoginRepository.service(mail: mail, password: password);
    if (status) {
      log("==============$status");
      Get.offAll(EmployeeView());
    } else {
      log("==============$status");
    }
  }
}
