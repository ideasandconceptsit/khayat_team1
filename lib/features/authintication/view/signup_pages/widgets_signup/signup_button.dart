import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/features/authintication/auth_controllers/signup_controller.dart';
import '../../../../../state_managment/app_routers.dart';
import '../../widgets/custom_button.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({super.key, required this.controller});
  final SignupController controller;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.isLoading.value
          ? Center(child: const CircularProgressIndicator(color: Colors.green,)) // 🌀 أثناء التحميل
          : CustomButton(
      text: "sign_up".tr,
      onPressed: () {
        if (controller.formkey.currentState!.validate()){
          controller.addUserData(controller.emailController.text, controller.passwordController.text, controller.nameController.text);
        }

      } ,
    );
    });
  }
}
