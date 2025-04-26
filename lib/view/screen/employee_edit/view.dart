import 'package:flutter/material.dart';
import 'package:getx_02_crud_operation/view/global_widget/button.dart';
import 'package:getx_02_crud_operation/view/global_widget/text_field.dart';
import 'package:get/get.dart';
import '../../../conteroller/get/employee_edit.dart';

class EmployeeEditScreen extends StatelessWidget {
  const EmployeeEditScreen({super.key});
  // final dynamic empData;

  @override
  Widget build(BuildContext context) {
    EmployeeEditController controller = Get.put(EmployeeEditController());
    // controller.dataInitial(data: empData);
    return Scaffold(
      appBar: AppBar(title: Text("Employee Edit")),
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
                title: "Edit",
                onTap: () {
                  controller.editEmployeeFun();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
