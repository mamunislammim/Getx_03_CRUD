import 'dart:developer';

import 'package:get/get.dart';
import 'package:getx_02_crud_operation/conteroller/service/delete_employee.dart';
import 'package:getx_02_crud_operation/conteroller/service/get_employee.dart';

class EmployeeController extends GetxController {
  RxList employeeList = [].obs;
  RxBool isLightTheme = true.obs;

  fetchEmployeeData() async {
    log("=========AAAAAAAAAAAAAAAAAAAAAAAAAAA=======");
    var data = await EmployeeService.getService();
    employeeList.value = data ?? [];
    log("======employeeList Length : ${employeeList.length}==========");
  }

  deleteEmployee({required int id}) async {
    var status = await EmployeeDeleteService.service(id: id);
    if (status) {
      fetchEmployeeData();
    }
  }

  @override
  void onInit() {
    fetchEmployeeData();
    super.onInit();
  }
}
