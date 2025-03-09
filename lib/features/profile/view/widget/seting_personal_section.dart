import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/features/profile/view/forget_password_view.dart';
import 'package:team1_khayat/shared/app_bottom_sheet/app_bottom_sheet.dart';
import 'package:team1_khayat/shared/custom_date_picker_field/custom_date_picker_field.dart';
import 'package:team1_khayat/shared/custom_form_field/csutom_form_field.dart';
import 'package:team1_khayat/shared/custom_switch_tile/custom_switch_tile.dart';
import 'package:team1_khayat/shared/navigation_service.dart';

import 'password_change_bottom_sheet.dart';

class SettingsPersonalInformationSection extends StatelessWidget {

  const SettingsPersonalInformationSection({
    super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       _buildSectionTitle(AppStrings.personalinformation),
       CustomFormField( labelText: AppStrings.fullname,),
       SizedBox(height:24.h ,),
       const CustomDatePickerField(label:  AppStrings.dateofbirthday,),
       
        SizedBox(height: 54.h),
        _buildSectionTitle( AppStrings.password, actionText:  AppStrings.change,
         onActionTap: () {
          showCustomAppBottomSheet(context ,
          height: MediaQuery.of(context).size.height *0.7,
          child:  PasswordChangeBottomSheet(
            onTap: () {
            
              NavigationService.navigateTo( ForgotPasswordView());
            },
          ),);
        }, 
        ),
        CustomFormField(labelText:  AppStrings.password ,obscureText: true , hintText: '*********',),
        SizedBox(height: 54.h),
        _buildSectionTitle( AppStrings.notifications),
      const CustomSwitchTile(title: AppStrings.sales, initialValue: true),
        const CustomSwitchTile(title:  AppStrings.newarrivals, initialValue: false),
        const CustomSwitchTile(title:  AppStrings.deliverystatuschanges, initialValue: false),
      ],
    );
  }

    Widget _buildSectionTitle(String title, {String? actionText, VoidCallback? onActionTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style:  AppTextStyles.tajawaltextStyle16),
          if (actionText != null)
            GestureDetector(
              onTap: onActionTap,
              child: Text(actionText, style:AppTextStyles.tajawaltextStyle14),
            ),
        ],
      ),
    );
  }

}