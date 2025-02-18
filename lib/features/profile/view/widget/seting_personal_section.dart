import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/shared/custom_form_field/csutom_form_field.dart';
import 'package:team1_khayat/shared/custom_switch_tile/custom_switch_tile.dart';

class SettingsPersonalInformationSection extends StatelessWidget {

  const SettingsPersonalInformationSection({
    super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       _buildSectionTitle('Personal Information'),
       CustomFormField( labelText: 'Full name',),
       SizedBox(height:24.h ,),
       CustomFormField(
        labelText: 'Date of Birth' , hintText: '12/12/1989',),
        SizedBox(height: 54.h),
        _buildSectionTitle('Password', actionText: 'Change'),
        CustomFormField(labelText: 'Password' ,obscureText: true , hintText: '*********',),
        SizedBox(height: 54.h),
        _buildSectionTitle('Notifications'),
      const CustomSwitchTile(title: 'Sales', initialValue: true),
        const CustomSwitchTile(title: 'New arrivals', initialValue: false),
        const CustomSwitchTile(title: 'Delivery status changes', initialValue: false),
      ],
    );
  }

   Widget _buildSectionTitle(String title, {String? actionText}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppTextStyles.tajawaltextStyle16),
          if (actionText != null)
            Text(actionText, style:AppTextStyles.tajawaltextStyle14),
        ],
      ),
    );
  }

}