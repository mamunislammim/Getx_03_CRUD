import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:getx_02_crud_operation/view/global_widget/app_text.dart';
import 'package:getx_02_crud_operation/view/screen/employee/widget/employee_card.dart';
import 'package:get/get.dart';
import 'package:getx_02_crud_operation/view/screen/employee_add/view.dart';
import '../../../conteroller/get/employee.dart';
import '../../../utils/common_fun/local_storage.dart';
import '../employee_edit/view.dart';

class EmployeeView extends StatelessWidget {
  const EmployeeView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(EmployeeController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: CustomTextWidget(title: "Employee Screen", fSize: 22, color: Colors.white),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              controller.fetchEmployeeData();
            },
            icon: Icon(Icons.refresh),
          ),
          Obx(
            () => Switch(
              value: controller.isLightTheme.value,
              onChanged: (v) {
                controller.isLightTheme.value = !controller.isLightTheme.value;

                controller.isLightTheme.isTrue
                    ? Get.changeTheme(ThemeData.light())
                    : Get.changeTheme(ThemeData.dark());
                LocalStorage().addData(key: "app_theme", value: controller.isLightTheme.toString());
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Obx(
            () => CustomTextWidget(
              title: "Total Employee :  ${controller.employeeList.length}",
              fSize: 25,
            ),
          ),
          Center(
            child: Obx(
              () => SizedBox(
                height: MediaQuery.sizeOf(context).height - 200,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.employeeList.length,
                  itemBuilder:
                      (context, index) => EmployeeCard(
                        empData: controller.employeeList[index],
                        deleteFun: () {
                          log("========================");
                          controller.deleteEmployee(id: controller.employeeList[index]['id']);
                        },
                        editFun: () {
                          Get.to(
                            EmployeeAddScreen(),
                            arguments: controller.employeeList[index],
                          )!.then((v) => controller.fetchEmployeeData());

                          // Get.to(EmployeeEditScreen(empData: controller.employeeList[index]))!.then((v)=> controller.fetchEmployeeData());
                          // Get.to(
                          //   EmployeeEditScreen(),
                          //   arguments: controller.employeeList[index],
                          // )!.then((v) => controller.fetchEmployeeData());
                        },
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(EmployeeAddScreen())!.then((v) => controller.fetchEmployeeData());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
