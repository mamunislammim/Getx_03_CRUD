import 'package:flutter/material.dart';
import 'package:getx_02_crud_operation/conteroller/get/employee_add.dart';
import 'package:getx_02_crud_operation/view/global_widget/button.dart';
import 'package:getx_02_crud_operation/view/global_widget/text_field.dart';
import 'package:get/get.dart';

class EmployeeAddScreen extends StatelessWidget {
  const EmployeeAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    EmployeeAddController controller = Get.put(EmployeeAddController());
    return Scaffold(
      appBar: AppBar(title: Text("Employee Add")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 10,
            children: [
              CustomTextField(textController: controller.nameController),
              CustomTextField(textController: controller.phoneController),
              CustomTextField(textController: controller.emailController),
              CustomTextField(textController: controller.designationController),
              CustomTextField(textController: controller.expertiseController),
              CustomTextField(textController: controller.addressController),
              CustomButton(
                title: "Add",
                onTap: () {
                  controller.addEmployeeFun();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
