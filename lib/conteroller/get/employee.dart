import 'dart:developer';

import 'package:get/get.dart';
import 'package:getx_02_crud_operation/conteroller/service/get_employee.dart';

class EmployeeController extends GetxController {
  RxList employeeList = [].obs;

  fetchEmployeeData() async {
    log("=========AAAAAAAAAAAAAAAAAAAAAAAAAAA=======");
    var data = await EmployeeService.getService();
    employeeList.value = data;
    log("======employeeList Length : ${employeeList.length}==========");
  }

  @override
  void onInit() {
    fetchEmployeeData();
    super.onInit();
  }
}
