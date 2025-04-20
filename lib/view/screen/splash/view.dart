import 'package:flutter/material.dart';
import 'package:getx_02_crud_operation/view/global_widget/app_text.dart';
import '../../../conteroller/get/splash.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(body: Center(child: CustomTextWidget(title: "Splash Screen")));
  }
}
