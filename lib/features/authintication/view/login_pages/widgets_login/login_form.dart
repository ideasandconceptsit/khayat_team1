import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        CustomTextField(label: "email".tr, controller: controller.emailController),
         SizedBox(height: 8.h),
        CustomTextField(
          label: "password".tr,
          controller: controller.passwordController,
          isPassword: true,
        ),
        SizedBox(height: 16.h),
        Align(
          alignment: Alignment.center,
          child: GestureDetector(
              onTap: () {
                // go to forget password
              },
              child:
                  Text("forgot_password".tr, style: AppStyle.textInLogin)),
        ),
         SizedBox(height: 5.h),
        GestureDetector(
          onTap: () => Get.toNamed(Routes.signupPage),
          child: Center(
            child: Text(
              "dont_have_account".tr,
              style: AppStyle.textInLogin
                  .copyWith(fontSize: 16, color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}
