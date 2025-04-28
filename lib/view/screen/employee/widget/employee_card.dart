import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:getx_02_crud_operation/conteroller/service/api_urls.dart';
import '../../../global_widget/app_text.dart';

class EmployeeCard extends StatelessWidget {
  const EmployeeCard({super.key, this.empData, required this.deleteFun, required this.editFun});
  final dynamic empData;
  // final EmployeeController controller;
  final VoidCallback deleteFun;
  final VoidCallback editFun;

  @override
  Widget build(BuildContext context) {
    log("${ApiUrls.baseIP + empData['image']}");
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topRight,
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  empData['image'] == ""
                      ? Image.network(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNNLEL-qmmLeFR1nxJuepFOgPYfnwHR56vcw&s",
                        height: 100,
                        width: 100,
                      )
                      : Image.network(
                        ApiUrls.baseIP + "/" + empData['image'],
                        height: 100,
                        width: 100,
                      ),
                  _buildColumn(title: 'Name', value: empData['name']),
                  _buildColumn(title: 'Phone', value: empData['phone']),
                  _buildColumn(title: 'Email', value: empData['email']),
                  _buildColumn(title: 'Designation', value: empData['designation']),
                  _buildColumn(title: 'Join Date', value: empData['join_date']),
                  _buildColumn(title: 'Expertise In', value: empData['expertise_in']),
                  _buildColumn(title: 'Address', value: empData['address']),
                ],
              ),
            ),
            Column(
              children: [
                IconButton(onPressed: deleteFun, icon: Icon(Icons.delete, color: Colors.red)),
                IconButton(onPressed: editFun, icon: Icon(Icons.edit_note, color: Colors.red)),
                IconButton(onPressed: editFun, icon: Icon(Icons.edit_note, color: Colors.red)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Column _buildColumn({required String title, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget(title: title),
        CustomTextWidget(title: value, fSize: 14, fontWeight: FontWeight.w300),
      ],
    );
  }
}
