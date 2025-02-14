import 'package:flutter/material.dart';
import '../../../../../core/app_style.dart';
import '../../../auth_controllers/login_controller.dart';
import '../../widgets/custom_button.dart';

class LoginButtons extends StatelessWidget {
  final LoginController controller;

  const LoginButtons({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          text: "LOGIN",
          onPressed: () {
            // تنفيذ تسجيل الدخول
          },
        ),
        const SizedBox(height: 20),
         Center(
          child: Text(
            "Continue as a Guest!",
            style: AppStyle.textInLogin.copyWith(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
