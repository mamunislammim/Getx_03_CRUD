import 'dart:io';

import 'package:flutter/material.dart';
import 'package:getx_02_crud_operation/conteroller/get/employee_add.dart';
import 'package:getx_02_crud_operation/view/global_widget/app_text.dart';
import 'package:getx_02_crud_operation/view/global_widget/button.dart';
import 'package:getx_02_crud_operation/view/global_widget/text_field.dart';
import 'package:get/get.dart';

class EmployeeAddScreen extends StatelessWidget {
  const EmployeeAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    EmployeeAddController controller = Get.put(EmployeeAddController());
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => controller.isEditPage.isTrue ? Text("Employee Edit") : Text("Employee Add"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 10,
            children: [
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.bottomRight,
                children: [
                  Obx(
                    () => Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(50),
                        image: DecorationImage(
                          image:
                              controller.imagePath.value == ""
                                  ? AssetImage("assets/image/logo.png")
                                  : FileImage(File(controller.imagePath.value)),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -10,
                    right: -10,
                    child: CircleAvatar(
                      child: IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder:
                                (context) => AlertDialog(
                                  title: CustomTextWidget(title: "Pick Image from"),
                                  actions: [
                                    IconButton(
                                      onPressed: () => controller.pickImageFun(type: "C"),
                                      icon: Icon(Icons.camera_alt),
                                    ),
                                    IconButton(
                                      onPressed: () => controller.pickImageFun(type: "G"),
                                      icon: Icon(Icons.image),
                                    ),
                                  ],
                                ),
                          );
                        },
                        icon: Icon(Icons.camera_alt),
                      ),
                    ),
                  ),
                ],
              ),

              CustomTextField(textController: controller.nameController),
              CustomTextField(textController: controller.phoneController),
              CustomTextField(textController: controller.emailController),
              CustomTextField(textController: controller.designationController),
              CustomTextField(textController: controller.expertiseController),
              CustomTextField(textController: controller.addressController),
              CustomButton(
                title: controller.isEditPage.isTrue ? "Edit" : "Add",
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
