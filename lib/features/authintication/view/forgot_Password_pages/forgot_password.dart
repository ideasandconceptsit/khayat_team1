import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/features/authintication/view/forgot_Password_pages/widgets_forgot_password/otp_input_field.dart';
import 'package:team1_khayat/features/authintication/view/forgot_Password_pages/widgets_forgot_password/phone_input_field.dart';
import '../../../../state_managment/app_routers.dart';
import '../../auth_controllers/forgot_password_controller.dart';
import '../../../../core/app_style.dart';
import '../signup_pages/widgets_signup/signup_appbar.dart';
import '../widgets/custom_button.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final ForgotPasswordController controller =
        Get.put(ForgotPasswordController());

    return Scaffold(
      appBar: buildSignupAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text("forgot_password".tr, style: AppStyle.navBar),
                SizedBox(height: 58.h),
                 Center(
                    child: Text(
                  "please enter your phone number".tr,
                  style: AppStyle.textForgot,
                )),
                SizedBox(height: 22.h),
                const PhoneInputField(),
                SizedBox(height: 37.h),
                CustomButton(text: "send".tr, onPressed: () {}),
                const SizedBox(height: 111),
                 Center(
                    child: Text("please enter otp code".tr,
                        style: AppStyle.textForgot)),
                SizedBox(height: 11.h),
                const OtpInputField(),
                SizedBox(height: 37.h),
                CustomButton(
                    text: "login".tr,
                    onPressed: () {
                      Get.toNamed(Routes.mani2);
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
