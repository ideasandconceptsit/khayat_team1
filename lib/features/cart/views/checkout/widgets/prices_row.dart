import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/core/utils/app_colors.dart';

class PriceRow extends StatelessWidget {
  const PriceRow({
    super.key, required this.title, required this.price,  this.isTextBold=false,
  });
  final String title;
  final String price;
  final bool isTextBold;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: AppTextStyles.textStyleMedium14.copyWith(color: AppColors.greyColor,fontSize: isTextBold?16.sp:null,fontWeight: isTextBold?FontWeight.w900:null),),
        Text("$price\$",style: AppTextStyles.textStyleBlack16.copyWith(fontSize: isTextBold?16.sp:null,fontWeight: isTextBold?FontWeight.w900:null),),
      ],
    );
  }
}