import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_02_crud_operation/utils/common_fun/local_storage.dart';
import 'package:getx_02_crud_operation/utils/theme/light_theme.dart';
import 'package:getx_02_crud_operation/view/screen/employee/view.dart';
import 'package:getx_02_crud_operation/view/screen/splash/view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var appTheme = await LocalStorage().getData(key: "app_theme");
  log("====app_theme===${appTheme}================");
  runApp(MyApp(appTheme: appTheme));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appTheme});
  final String appTheme;


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme == "true" ? ThemeData.light() : ThemeData.dark(),
      home: SplashScreen(),
    );
  }
}
