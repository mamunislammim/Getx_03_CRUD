import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_02_crud_operation/conteroller/service/employee_add.dart';
import 'package:image_picker/image_picker.dart';

import '../service/employee_edit.dart';

class EmployeeAddController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController designationController = TextEditingController();
  TextEditingController expertiseController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  RxBool isEditPage = false.obs;
  int id = 0;

  RxString imagePath = "".obs;
  XFile? image;

  pickImageFun({required String type}) async {
    final ImagePicker picker = ImagePicker();

    if (type == "C") {
      image = await picker.pickImage(source: ImageSource.camera);
    } else {
      image = await picker.pickImage(source: ImageSource.gallery);
    }
    if (image != null) {
      imagePath.value = image!.path;
    }
    Get.back();
  }

  dataInitial({required dynamic data}) {
    log("===============${data}=======================");
    nameController.text = data['name'] ?? "";
    phoneController.text = data['phone'] ?? "";
    emailController.text = data['email'] ?? "";
    designationController.text = data['designation'] ?? "";
    expertiseController.text = data['expertise_in'] ?? "";
    addressController.text = data['address'] ?? "";
    id = data['id'] ?? "";
  }

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
      "image": image,
    };

    var status = false;

    if (isEditPage.isTrue) {
      status = await EmployeeEditService.service(data: jsonData, id: id);
    } else {
      // status = await EmployeeAddService.service(data: jsonData);
      status = await EmployeeAddService.serviceWithImage(data: jsonData);
    }

    if (status == true) {
      Get.back();
    }
  }

  @override
  void onInit() {
    var a = Get.arguments;
    log("=============A : $a===========================");
    if (a != null) {
      isEditPage.value = true;
      dataInitial(data: a);
    }
    super.onInit();
  }
}
