import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/app_style.dart';
import '../../../../../state_managment/app_routers.dart';
import '../../../auth_controllers/login_controller.dart';
import '../../widgets/custom_text_field.dart';

class LoginForm extends StatelessWidget {
  final LoginController controller;

  const LoginForm({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(label: "Email", controller: controller.emailController),
        const SizedBox(height: 10),
        CustomTextField(
          label: "Password",
          controller: controller.passwordController,
          isPassword: true,
        ),
        const SizedBox(height: 10),
        Align(
          alignment: Alignment.center,
          child: GestureDetector(
              onTap: () {
                // go to forget password
              },
              child:
                 const Text("Forgot your password?", style: AppStyle.textInLogin)),
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () => Get.toNamed(Routes.signupPage),
          child: Center(
            child: Text(
              "Don't have an account?",
              style: AppStyle.textInLogin
                  .copyWith(fontSize: 16, color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}
