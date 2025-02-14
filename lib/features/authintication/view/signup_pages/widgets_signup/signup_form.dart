import 'package:flutter/material.dart';
import '../../../auth_controllers/signup_controller.dart';
import '../../widgets/custom_text_field.dart';

class SignupForm extends StatelessWidget {
  final SignupController controller;

  const SignupForm({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(label: "Name", controller: controller.nameController),
        const SizedBox(height: 20),
        CustomTextField(label: "Email", controller: controller.emailController),
        const SizedBox(height: 20),
        CustomTextField(
          label: "Password",
          controller: controller.passwordController,
          isPassword: true,
        ),
        const SizedBox(height: 20),
        CustomTextField(
          label: "Phone",
          controller: controller.phoneController,
          isNumber: true,
        ),
      ],
    );
  }
}
