import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:team1_khayat/core/app_colors.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/features/appointment/views/widgets/select_time_picker_widget.dart';

class SelectTimeSection extends StatelessWidget {
  const SelectTimeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              AppStrings.selectTime.tr,
              style: AppTextStyles.textStyleMedium16
          ),
          Container(
            height: 71.5.h,
            width: double.infinity,
            decoration: ShapeDecoration(
              color: AppColors.lightGrey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            child: const SelectTimePickerWidget(),

          ),
        ],
      ),
    );
  }

}