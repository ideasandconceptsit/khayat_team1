import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/features/profile/controller/change_password_controller.dart';
import 'package:team1_khayat/features/profile/repos/change_password-repository.dart';
import 'package:team1_khayat/shared/custom_app_button/custom_app_button.dart';
import 'package:team1_khayat/shared/custom_form_field/csutom_form_field.dart';
import 'package:team1_khayat/shared/app_snakbar/app_snackbar.dart';

class PasswordChangeBottomSheet extends StatelessWidget {
  final void Function()? onTap;

  final ChangePasswordController _changePasswordController =
      Get.put(ChangePasswordController(ChangePasswordRepository()));

  PasswordChangeBottomSheet({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _changePasswordController.formKeyChangePassword,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(AppStrings.changePassword.tr,
                style: AppTextStyles.tajawaltextStyle18),
            SizedBox(height: 18.h),
            CustomFormField(
              hintText: AppStrings.oldPassword.tr,
              controller: _changePasswordController.currentPasswordController,
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
                child: Text(AppStrings.forgotpassword.tr,
                    style: AppTextStyles.tajawaltextStyle14),
              ),
            ),
            SizedBox(height: 14.h),
            CustomFormField(
              hintText: AppStrings.newPassword.tr,
              controller: _changePasswordController.newPasswordController,
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
              controller: _changePasswordController.confirmPasswordController,
              obscureText: true,
              validator: (value) {
                if (value !=
                    _changePasswordController.newPasswordController.text) {
                  return "كلمات المرور غير متطابقة!";
                }
                return null;
              },
            ),
            SizedBox(height: 32.h),
            Obx(() {
              return Column(
                children: [
                  CustomAppButton(
                    text: _changePasswordController.isLoading.value
                        ? '...جاري التغيير'
                        : AppStrings.savePassword.tr,
                    height: 48.h,
                    onTap: () async {
                      bool success =
                          await _changePasswordController.changeUserData();

                      if (success) {
                        SnackbarHelper.showSuccessSnackbar(
                            "تم تغيير كلمة المرور بنجاح!");

                        Future.delayed(Duration(seconds: 2), () {
                          if (Get.isSnackbarOpen) {
                            Get.back();
                          }
                        });
                      } else {
                        SnackbarHelper.showErrorSnackbar(
                            _changePasswordController.errorMessage.value);
                      }
                    },
                  ),
                ],
              );
            }),
            SizedBox(height: 48.h),
          ],
        ),
      ),
    );
  }
}
