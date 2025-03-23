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

class PersonalInformationChangeBottomSheet extends StatelessWidget {
  final void Function()? onTap;

  final _resetPasswordController =
      Get.put(ResetPasswordController(RestPasswordRepository()));  
  final ProfileController _profileController = Get.find();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); 

  PersonalInformationChangeBottomSheet({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(AppStrings.changeInformation.tr, style: AppTextStyles.tajawaltextStyle18),
            SizedBox(height: 18.h),

            CustomFormField(
              hintText: AppStrings.newName.tr,
              controller: _profileController.oldPasswordController,
              obscureText: true,
               
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "يرجى إدخال الاسم الجديد";
                }
                return null;
              },
            ),
             SizedBox(height: 17.h), 

            CustomFormField(
              hintText:  AppStrings.newEmail.tr,
              controller: _resetPasswordController.newPasswordController,
              obscureText: true,
              validator: (value) {
                if (value == null || value.length < 6) {
                  return " يرجي ادخال الاميل الجديد";
                }
                return null;
              },
            ),

            SizedBox(height: 32.h),

            DefaultButton(
              text:  AppStrings.saveChanges.tr,
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
