

import 'package:flutter/material.dart';
import '../../../global_widget/app_text.dart';


class EmployeeCard extends StatelessWidget {
  const EmployeeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildColumn(title: 'Name', value: 'Md Rafiul Razu'),
              _buildColumn(title: 'Phone', value: '01788888888'),
              _buildColumn(title: 'Email', value: 'razu@gmail.com'),
              _buildColumn(title: 'Designation', value: 'Software Engineer'),
            ],
          ),
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
