import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:team1_khayat/core/app_colors.dart';

// Created this widget with reusability in mind to be used across multiple pages,
// the app contains a lot of cards with the same shadow
class CustomCardWithShadow extends StatelessWidget {
  const CustomCardWithShadow({super.key, required this.height, required this.width, required this.child, this.padding});
  final double height;
  final double width;
  final Widget child;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: padding,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      width: width,
      height: height,
      decoration: _buildCartProductDecoration(),
      child: child,

    );
  }
  ShapeDecoration _buildCartProductDecoration() {
    return ShapeDecoration(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      shadows: [
        BoxShadow(
          color: AppColors.shadowColor,
          blurRadius: 25.r,
          offset: const Offset(0, 1),
          spreadRadius: 0,
        )
      ],
    );
  }
}