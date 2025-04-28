import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/utils/app_colors.dart';

import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/core/app_styles.dart';

class HelpfullRow extends StatelessWidget {
  const HelpfullRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          AppStrings.helpful.tr,
          style: AppTextStyles.textStyleRegular11.copyWith(color: AppColors.greyColor),
        ),SizedBox(width: 3.w,),
        IconButton(onPressed: (){}, icon: Icon(Icons.thumb_up,color: AppColors.greyColor,size: 20.w,)),
      ],
    );
  }
}