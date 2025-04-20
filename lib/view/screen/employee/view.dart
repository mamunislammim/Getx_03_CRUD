import 'package:flutter/material.dart';
import 'package:getx_02_crud_operation/view/global_widget/app_text.dart';
import 'package:getx_02_crud_operation/view/screen/employee/widget/employee_card.dart';
import 'package:get/get.dart';
import '../../../conteroller/get/employee.dart';

class EmployeeView extends StatelessWidget {
  const EmployeeView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EmployeeController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: CustomTextWidget(title: "Employee Screen", fSize: 22, color: Colors.white),
        centerTitle: true,
      ),
      body: Center(child: Column(children: [EmployeeCard(), EmployeeCard(), EmployeeCard()])),
    );
  }
}
