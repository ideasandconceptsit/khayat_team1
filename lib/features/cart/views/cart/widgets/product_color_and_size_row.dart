import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_colors.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/core/app_styles.dart';

class ColorAndSizeRow extends StatelessWidget {
  const ColorAndSizeRow({
    super.key, required this.color, required this.size,
  });
  final String? color;
  final String? size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if(color!=null)Padding(
          padding:  EdgeInsetsDirectional.only(end: 22.w),
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: AppStrings.color.tr,
                  style:  AppTextStyles.textStyleRegular11.copyWith(color: AppColors.greyColor)
                ),
                TextSpan(
                  text: color,
                   style:  AppTextStyles.textStyleRegular11
                ),
              ],
            ),
          ),
        ),
    if(size!=null)Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: AppStrings.size.tr,
              style:  AppTextStyles.textStyleRegular11.copyWith(color: AppColors.greyColor),
              ),
              TextSpan(
                text: size,
    style:  AppTextStyles.textStyleRegular11,
              ),
            ],
          ),
        ),

      ],
    );
  }
}