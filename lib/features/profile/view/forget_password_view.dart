import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/shared/custom_app_bar/custom_app_bar.dart';
import 'package:team1_khayat/shared/custom_app_button/custom_app_button.dart';
import 'package:team1_khayat/shared/custom_form_field/email_form_field.dart';
import '../../../../core/app_style.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        arrowBackVisibility: true,
        arrowBackOnPressed: () {
          Get.back();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Text(AppStrings.forgotpassword.tr, style: AppStyle.navBar),
                  SizedBox(height: 58.h),
                  Center(
                    child: Text(
                      AppStrings.pleaseenterYourEmail.tr,
                      style: AppTextStyles.tajawaltextStyle14.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 58.h),
                  EmailFormField(
                    hintText: AppStrings.email.tr,
                  ),
                  SizedBox(height: 22.h),
                  CustomAppButton(
                    text: AppStrings.send.tr,
                    height: 48.h,
                    onTap: () {
                      
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}