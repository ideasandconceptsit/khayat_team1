import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:team1_khayat/core/app_colors.dart';
import 'package:team1_khayat/core/app_style.dart';
import 'package:team1_khayat/core/app_styles.dart';


class CustomDropMenu extends StatefulWidget {
  const CustomDropMenu({super.key,required this.title, required this.values});
  final String title;
  final List<String> values ;


  @override
  State<CustomDropMenu> createState() => _CustomDropMenuState();
}

class _CustomDropMenuState extends State<CustomDropMenu> {

  String? selectedValue;

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
          value: selectedValue??widget.title,
          isDense: true,
          icon: const Icon(Icons.keyboard_arrow_down  ),
          style:   AppTextStyles.textStyleMedium14.copyWith(color: AppColors.blackColor),
          onChanged: (String? newValue) {
            setState(() {
              selectedValue = newValue;
            });
          },
          items: widget.values.map<DropdownMenuItem<String>>((String value) {
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
