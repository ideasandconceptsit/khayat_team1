import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:team1_khayat/core/app_colors.dart';
import 'package:team1_khayat/core/app_styles.dart';

class CustomAddCardTextFormFiled extends StatelessWidget {
  const CustomAddCardTextFormFiled(
      {super.key,
      required this.controller,
      required this.labelText,
      this.formats,
      this.keyboardType,
        this.validator,
      this.suffixIcon});

  final TextEditingController controller;
  final String labelText;
  final List<TextInputFormatter>? formats;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 64.h,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
        shadows: [
          BoxShadow(
            color: const Color(0x0C000000),
            blurRadius: 8.r,
            offset: const Offset(0, 1),
            spreadRadius: 0.r,
          )
        ],
      ),
      child: Center(
          child: TextFormField(
        validator: validator,
        controller: controller,
        inputFormatters: formats,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          border: InputBorder.none,
          labelText: labelText,
          contentPadding: EdgeInsets.only(left: 20.w),
          hintStyle: AppTextStyles.textStyleRegular14
              .copyWith(color: AppColors.greyColor),
        ),
      )),
    );
  }
}
