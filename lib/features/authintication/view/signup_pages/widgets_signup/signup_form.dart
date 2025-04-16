import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import '../../../auth_controllers/signup_controller.dart';
import '../../widgets/custom_text_field.dart';

class SignupForm extends StatelessWidget {
  final SignupController controller;

  const SignupForm({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return
      Form(
        key: controller.formkey,
        child:Column(
      children: [

        CustomTextField(label: "name".tr, controller: controller.nameController),
         SizedBox(height: 23.h),
        CustomTextField(label: "email".tr, controller: controller.emailController,
        isEmail: true,),
         SizedBox(height: 23.h),
        CustomTextField(
          label: "password".tr,
          controller: controller.passwordController,
          isPassword: true,
        ),
         SizedBox(height: 23.h),
        CustomTextField(
          label: "phone".tr,
          controller: controller.phoneController,
          isNumber: true,
        ),
      ],
    ));
  }
}
