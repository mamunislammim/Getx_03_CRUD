import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_02_crud_operation/conteroller/service/employee_add.dart';

class EmployeeAddController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController designationController = TextEditingController();
  TextEditingController expertiseController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  addEmployeeFun() async {
    // use Validator here.....

    Map<String, dynamic> jsonData = {
      "name": nameController.text,
      "phone": phoneController.text,
      "email": emailController.text,
      "join_date": "2024-09-29",
      "designation": designationController.text,
      "address": addressController.text,
      "roles": "Test",
      "expertise_in": expertiseController.text,
    };
    var status = await EmployeeAddService.service(data: jsonData);

    if (status == true) {
      Get.back();
    }
  }
}
