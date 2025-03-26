import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/shared/custom_app_button/custom_app_button.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    super.key, required this.title, this.retryFunction,
  });
  final String title;
  final void Function()? retryFunction;

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title,style: AppTextStyles.textStyleBlack18,),
        SizedBox(height: 50.h,),
        CustomAppButton(text: AppStrings.tryAgain.tr,onTap: retryFunction,)
      ],
    );
  }
}