import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../conteroller/get/login.dart';
import '../../global_widget/app_text.dart';
import '../../global_widget/button.dart';
import '../../global_widget/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Screen")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextWidget(title: "Email"),
              CustomTextField(textController: controller.mailController),
              SizedBox(height: 10),
              CustomTextWidget(title: "Password"),
              CustomTextField(textController: controller.passwordController),
              SizedBox(height: 10),
              CustomButton(
                title: "Login",
                onTap: () {
                  controller.loginFun(
                    mail: controller.mailController.text,
                    password: controller.passwordController.text,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
