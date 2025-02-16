import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:team1_khayat/features/authintication/view/login_pages/login_page.dart';
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
          text: "login_button".tr,
          onPressed: () {},
        ),
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
