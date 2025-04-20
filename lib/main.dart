import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_02_crud_operation/view/screen/employee/view.dart';
import 'package:getx_02_crud_operation/view/screen/splash/view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen());
  }
}
