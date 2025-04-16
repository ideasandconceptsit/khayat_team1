import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/features/profile/controller/change_user_data_controller.dart';
import 'package:team1_khayat/features/profile/repos/change_user_data_repository.dart';
import 'package:team1_khayat/shared/app_buttons/app_buttons.dart';
import 'package:team1_khayat/shared/custom_form_field/csutom_form_field.dart';

class PersonalInformationChangeBottomSheet extends StatelessWidget {
  final ChangeUserDataController _controller =
      Get.put(ChangeUserDataController(ChangeUserDtaRepository()));

  PersonalInformationChangeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _controller.formKeyChangeUserData,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
        child: Column(
          children: [
            Text(AppStrings.changeInformation.tr,
                style: AppTextStyles.tajawaltextStyle18),
            SizedBox(height: 18.h),
            CustomFormField(
              hintText: AppStrings.newName.tr,
              controller: _controller.newNameController,
              validator: (value) => value == null || value.isEmpty
                  ? "يرجى إدخال الاسم الجديد"
                  : null,
            ),
            SizedBox(height: 17.h),
            CustomFormField(
              hintText: AppStrings.newEmail.tr,
              controller: _controller.newEmailController,
              validator: (value) => value == null || !GetUtils.isEmail(value)
                  ? "يرجى إدخال بريد إلكتروني صحيح"
                  : null,
            ),
            SizedBox(height: 32.h),
            Obx(() {
              return DefaultButton(
                text: _controller.isLoading.value
                    ? "..جاري التغيير"
                    : AppStrings.saveChanges.tr,
                press: _controller.isLoading.value
                    ? null
                    : () async {
                        if (_controller.formKeyChangeUserData.currentState!
                            .validate()) {
                          await _controller.changeUserData();
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
