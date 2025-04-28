import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:team1_khayat/core/utils/app_colors.dart';
import 'package:team1_khayat/core/app_styles.dart';


class CustomDropMenu extends StatelessWidget {
  const CustomDropMenu({super.key,required this.title, required this.values, this.onChange,required this.selectedValue});
  final String title;
  final List<String> values ;
  final void Function(String?)? onChange;
  final String selectedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          padding: EdgeInsetsDirectional.symmetric(vertical: 10.h,horizontal: 12.w),
          borderRadius: BorderRadius.circular(12.r),
          dropdownColor: AppColors.scaffoldBackgroundColor,
          isExpanded: true,
          value: selectedValue,
          isDense: true,
          icon: const Icon(Icons.keyboard_arrow_down  ),
          style:   AppTextStyles.textStyleMedium14.copyWith(color: AppColors.blackColor),
          onChanged: onChange,
          items: values.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
