import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../../shared/bottom_navigation_bar/view/buttom_nav_bar.dart';
import '../../../../../state_managment/app_routers.dart';

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
          onPressed: () {
           // Get.toNamed(Routes.bottomNavBar);
            Get.to(BottomNavBar());

          },
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
