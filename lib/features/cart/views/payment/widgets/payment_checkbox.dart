import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:team1_khayat/core/app_colors.dart';

class PaymentCheckbox extends StatelessWidget {
  const PaymentCheckbox({
    super.key, required this.isSelected, this.onTap,
  });
  final bool isSelected;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 22.h,
      width: 22.h,
      child: Checkbox(
        value:isSelected,
        activeColor:AppColors.blackColor ,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
        onChanged: (value) {
          if(onTap!=null)onTap!();
        },
      ),
    );
  }
}