import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/features/profile/controller/reset_password_controller.dart';
import 'package:team1_khayat/features/profile/repos/reset_password_repository.dart';
import 'package:team1_khayat/shared/app_buttons/app_buttons.dart';
import 'package:team1_khayat/shared/custom_form_field/csutom_form_field.dart';
import 'package:team1_khayat/shared/custom_form_field/email_form_field.dart';
class PasswordChangeWidget extends StatelessWidget {
  PasswordChangeWidget({super.key, this.onTap});

  final _resetPassController =
      Get.put(ResetPasswordController(RestPasswordRepository()));


 

  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _resetPassController.formKeyResetPassword,
        child: Column(
          children: [
            Text('Password Change', style: AppTextStyles.tajawaltextStyle18),
            SizedBox(height: 18.h),

            EmailFormField(
              hintText: "Email",
              controller: _resetPassController.emailController,
              validator: (value) {
                if (value == null || value.isEmpty || !value.contains('@')) {
                  return "يرجى إدخال بريد إلكتروني صحيح";
                }
                return null;
              },
            ),
            SizedBox(height: 24.h),

            CustomFormField(
              hintText: "New Password",
              controller: _resetPassController.newPasswordController,
              validator: (value) {
                if (value == null || value.length < 6) {
                  return "يجب أن تكون كلمة المرور 6 أحرف على الأقل";
                }
                return null;
              },
            ),
            SizedBox(height: 24.h),

            CustomFormField(
              hintText: "Confirm Password",
              controller: _resetPassController.confirmPasswordController,
              validator: (value) {
                if (value != _resetPassController.newPasswordController.text) {
                  return "كلمة المرور غير متطابقة";
                }
                return null;
              },
            ),
            SizedBox(height: 32.h),

            Obx(() {
              return DefaultButton(
                text: _resetPassController.isLoading.value ? 'جاري الحفظ...' : 'SAVE PASSWORD',
                press: () async {
                  if (_resetPassController.formKeyResetPassword.currentState!.validate()) {
                    await _resetPassController.resetPassword(
                      email: _resetPassController.emailController.text.trim(),
                      newPassword: _resetPassController.newPasswordController.text.trim(),
                    );

                    if (_resetPassController.errorMessage.value.isEmpty) {
                      Get.until((route) => Get.currentRoute == '/SettingView');
                    }
                  }
                },
              );
            }),
            SizedBox(height: 48.h),
          ],
        ),
      ),
    );
  }
}
