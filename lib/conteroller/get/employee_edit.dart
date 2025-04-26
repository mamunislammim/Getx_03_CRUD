import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_02_crud_operation/conteroller/service/employee_add.dart';

import '../service/employee_edit.dart';

class EmployeeEditController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController designationController = TextEditingController();
  TextEditingController expertiseController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  int id = 0;

  dataInitial({required dynamic data}) {
    log("===============${data}=======================");
    nameController.text = data['name'];
    phoneController.text = data['phone'];
    emailController.text = data['email'];
    designationController.text = data['designation'];
    expertiseController.text = data['expertise_in'];
    addressController.text = data['address'];
    id = data['id'];
  }

  editEmployeeFun() async {
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
    var status = await EmployeeEditService.service(data: jsonData, id: id);

    if (status == true) {
      Get.back();
    }
  }

  @override
  void onInit() {
    var a = Get.arguments;
    dataInitial(data: a);
    log("====================${a}=======");
    super.onInit();
  }
}
