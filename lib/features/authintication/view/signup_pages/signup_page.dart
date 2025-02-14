import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/features/authintication/view/signup_pages/widgets_signup/signup_appbar.dart';
import 'package:team1_khayat/features/authintication/view/signup_pages/widgets_signup/signup_button.dart';
import 'package:team1_khayat/features/authintication/view/signup_pages/widgets_signup/signup_form.dart';
import 'package:team1_khayat/features/authintication/view/signup_pages/widgets_signup/social_login.dart';
import '../../auth_controllers/signup_controller.dart';
import '../../../../core/app_colors.dart';
import '../../../../core/app_style.dart';
import '../widgets/ndicator_widget.dart';

class SignupPage extends StatelessWidget {
   SignupPage({super.key});
  final SignupController controller = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: buildSignupAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Sign up'.tr, style: AppStyle.navBar),
            const SizedBox(height: 20),
            SignupForm(controller: controller),
            const SizedBox(height: 50),
            const SignupButton(),
            const SizedBox(height: 100),
            const SocialLogin(),
            const SizedBox(height: 50),
            Center(child: buildHomeIndicator()),
          ],
        ),
      ),
    );
  }
}
