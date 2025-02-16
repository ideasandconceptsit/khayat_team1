import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:team1_khayat/core/app_colors.dart';
import 'package:team1_khayat/core/app_styles.dart';

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
      this.isTextBold = true});

  final Color color;
  final double width;
  final double? height;
  final String text;
  final bool isTextBold;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        //default height 40
        height: height??40.h,
        decoration: _buildAppButtonDecoration(),
        child: Center(
          child: Text(
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
