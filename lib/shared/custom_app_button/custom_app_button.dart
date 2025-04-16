import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/core/utils/app_colors.dart';

// Created this widget with reusability in mind to be used across multiple pages,
// including Auth Pages, Filter Page, Client Review, Adding to Favourites, and more.

class CustomAppButton extends StatelessWidget {
  const CustomAppButton(
      {super.key,
        this.width = double.infinity,
        this.height,
        this.color = AppColors.primaryColor,
        required this.text,
        this.onTap,

        //the text has 2 styles across the app
        this.isTextBold = true,
        this.isLoading = false, this.widget,
      });

  final Color color;
  final double width;
  final double? height;
  final Widget? widget;
  final String text;
  final bool isTextBold;
  final bool isLoading;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading?null:onTap,
      child: Container(
        width: width,
        //default height 40
        height: height??40.h,
        decoration: _buildAppButtonDecoration(),
        child: Center(
          child: isLoading? Padding(
            padding:  EdgeInsets.all(6.h),
            child: const AspectRatio(aspectRatio: 1,child
                : CircularProgressIndicator(color: AppColors.whiteColor,)),
          ):widget??Text(
              text,
              textAlign: TextAlign.center,
              style:isTextBold?AppTextStyles.textStyleBold20:AppTextStyles.textStyleRegular14
          ),
        ),
      ),
    );
  }

  ShapeDecoration _buildAppButtonDecoration() {
    return ShapeDecoration(
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
      shadows:  [
        BoxShadow(
          color: AppColors.redShadowColor,
          blurRadius: 8.r,
          offset: const Offset(0, 4),
          spreadRadius: 0,
        )
      ],
    );
  }
}
