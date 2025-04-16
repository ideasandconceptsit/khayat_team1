import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../core/utils/app_style.dart';

import '../../../auth_controllers/login_controller.dart';
import '../../widgets/custom_button.dart';

class LoginButtons extends StatelessWidget {
  final LoginController controller;

  const LoginButtons({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() {
          return controller.isLoading.value
              ? Center(child: const CircularProgressIndicator(color: Colors.green,)) // 🌀 أثناء التحميل
              : CustomButton(
            text: "login_button".tr,
            onPressed: () {
              if (controller.formkey.currentState!.validate()) {
                controller.fetchUserData(
                  controller.emailController.text,
                  controller.passwordController.text,
                );
              }
            },
          );
        }),
        SizedBox(height: 21.h),
        Center(
          child: Text(
            "continue_as_guest".tr,
            style: AppStyle.textInLogin.copyWith(color: Colors.black),
          ),
        ),
      ],
    );
  }
}

