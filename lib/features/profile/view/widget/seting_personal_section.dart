import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/features/profile/controller/language_controller.dart';
import 'package:team1_khayat/features/profile/controller/profile_controller.dart';
import 'package:team1_khayat/features/profile/view/forget_password_view.dart';
import 'package:team1_khayat/features/profile/view/widget/personal_information_change_buttom_sheet.dart';
import 'package:team1_khayat/features/profile/view/widget/section_title_widget.dart';
import 'package:team1_khayat/shared/app_bottom_sheet/app_bottom_sheet.dart';
import 'package:team1_khayat/shared/custom_date_picker_field/custom_date_picker_field.dart';
import 'package:team1_khayat/shared/custom_form_field/csutom_form_field.dart';
import 'package:team1_khayat/shared/navigation_service.dart';

import 'password_change_bottom_sheet.dart';

class SettingsPersonalInformationSection extends StatelessWidget {
  final ProfileController profileController = Get.find();
  final LanguageController languageController = Get.put(LanguageController());

  SettingsPersonalInformationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(
          title: AppStrings.personalinformation.tr,
          actionText: AppStrings.change.tr,
          onActionTap: () {
            showCustomAppBottomSheet(context,
                height: MediaQuery.of(context).size.height * 0.7,
                child: PersonalInformationChangeBottomSheet());
          },
        ),
        CustomFormField(
          labelText: AppStrings.fullname.tr,
          hintText: profileController.userModel.value?.name,
        ),
        SizedBox(
          height: 24.h,
        ),
        CustomDatePickerField(
          label: AppStrings.dateofbirthday.tr,
        ),
        SizedBox(height: 54.h),
        SectionTitle(
          title: AppStrings.password.tr,
          actionText: AppStrings.change.tr,
          onActionTap: () {
            showCustomAppBottomSheet(
              context,
              height: MediaQuery.of(context).size.height * 0.7,
              child: PasswordChangeBottomSheet(
                onTap: () {
                  NavigationService.navigateTo(ForgotPasswordView());
                },
              ),
            );
          },
        ),
        CustomFormField(
          labelText: AppStrings.password.tr,
          obscureText: true,
          hintText: '*********',
        ),
        SizedBox(height: 54.h),
        SectionTitle(
          title: AppStrings.language.tr,
          showToggle: true,
        ),
      ],
    );
  }
}
