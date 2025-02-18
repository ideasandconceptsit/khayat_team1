import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/features/authintication/view/signup_pages/widgets_signup/signup_appbar.dart';
import 'package:team1_khayat/features/authintication/view/signup_pages/widgets_signup/signup_button.dart';
import 'package:team1_khayat/features/authintication/view/signup_pages/widgets_signup/signup_form.dart';
import 'package:team1_khayat/features/authintication/view/signup_pages/widgets_signup/social_signup.dart';
import '../../auth_controllers/signup_controller.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_style.dart';

class SignupPage extends StatelessWidget {
   SignupPage({super.key});
  final SignupController controller = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: buildSignupAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('sign_up'.tr, style: AppStyle.navBar),
             SizedBox(height: 23.h),
            SignupForm(controller: controller),
             SizedBox(height: 55.h),
            const SignupButton(),
             SizedBox(height: 68.h),
            const SocialSignup(),
          ],
        ),
      ),
    );
  }
}
