import 'package:get/get.dart';
import 'package:getx_02_crud_operation/conteroller/service/get_employee.dart';

class EmployeeController extends GetxController {


  fetchEmployeeData() async {
    await EmployeeService.getService();
  }

  @override
  void onInit() {
    fetchEmployeeData();
    super.onInit();
  }
}
