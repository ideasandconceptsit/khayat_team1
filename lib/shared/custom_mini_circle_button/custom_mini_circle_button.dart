import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:team1_khayat/core/utils/app_colors.dart';

class CustomMiniCircleButton extends StatelessWidget {
  const CustomMiniCircleButton({super.key, this.onTap, required this.icon, this.isLoading=false});

  final void Function()? onTap;
  final IconData icon;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(6.w),
        decoration: buildQuantityButtonDecoration(),
        child: isLoading?SizedBox(height: 24.h,width: 24.h,child: const CircularProgressIndicator(color: AppColors.primaryColor,)):Icon(
          icon,
          size: 24.h,
          color: AppColors.greyColor,
        ),
      ),
    );
  }

  ShapeDecoration buildQuantityButtonDecoration() {
    return ShapeDecoration(
      color: Colors.white,
      shape: const OvalBorder(),
      shadows: [
        BoxShadow(
          color: AppColors.quantityButtonShadowColor,
          blurRadius: 8.r,
          offset: const Offset(0, 4),
          spreadRadius: 0,
        )
      ],
    );
  }
}