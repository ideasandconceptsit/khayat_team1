import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/features/profile/controller/profile_controller.dart';
import 'package:team1_khayat/features/profile/controller/reset_password_controller.dart';
import 'package:team1_khayat/features/profile/repos/reset_password_repository.dart';
import 'package:team1_khayat/shared/app_buttons/app_buttons.dart';
import 'package:team1_khayat/shared/app_snakbar/app_snackbar.dart';
import 'package:team1_khayat/shared/custom_form_field/csutom_form_field.dart';

class PasswordChangeBottomSheet extends StatelessWidget {
  final void Function()? onTap;

  final _resetPasswordController =
      Get.put(ResetPasswordController(RestPasswordRepository()));  
  final ProfileController _profileController = Get.find();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); 

  PasswordChangeBottomSheet({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(AppStrings.changePassword.tr, style: AppTextStyles.tajawaltextStyle18),
            SizedBox(height: 18.h),

            CustomFormField(
              hintText:  AppStrings.oldPassword.tr,
              controller: _profileController.oldPasswordController,
              obscureText: true,
               
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "يرجى إدخال كلمة المرور القديمة";
                }
                return null;
              },
            ),
             SizedBox(height: 17.h), 

          GestureDetector(
            onTap: onTap,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(AppStrings.forgotpassword.tr, style: AppTextStyles.tajawaltextStyle14),
            ),
          ),
            SizedBox(height: 14.h),


            CustomFormField(
              hintText: AppStrings.newPassword.tr,
              controller: _resetPasswordController.newPasswordController,
              obscureText: true,
              validator: (value) {
                if (value == null || value.length < 6) {
                  return "يجب أن تكون كلمة المرور الجديدة 6 أحرف على الأقل";
                }
                return null;
              },
            ),
            SizedBox(height: 14.h),

            CustomFormField(
              hintText: AppStrings.reapeatNewPassword.tr,
              controller: _resetPasswordController.confirmPasswordController,
              obscureText: true,
              validator: (value) {
                if (value != _resetPasswordController.newPasswordController.text) {
                  return "كلمات المرور غير متطابقة!";
                }
                return null;
              },
            ),
            SizedBox(height: 32.h),

            DefaultButton(
              text: AppStrings.savePassword.tr,
              press: () async {
                if (!_formKey.currentState!.validate()) {
                  return;
                }

                if (!_profileController.checkOldPassword()) {
                  SnackbarHelper.showErrorSnackbar("كلمة المرور القديمة غير صحيحة!");
                  return;
                }

                await _resetPasswordController.resetPassword(
                
                );

                SnackbarHelper.showSuccessSnackbar("تم تغيير كلمة المرور بنجاح!");
                Get.back();
              },
            ),
            SizedBox(height: 48.h),
          ],
        ),
      ),
    );
  }
}
