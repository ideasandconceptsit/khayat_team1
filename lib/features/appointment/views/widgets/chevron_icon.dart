import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:team1_khayat/core/utils/app_colors.dart';

class ChevronIcon extends StatelessWidget {
  const ChevronIcon({
    super.key, required this.isRight,
  });
  final bool isRight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36.w,
      height: 36.w,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border.all(color: AppColors.greyColor),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Center(
        child: Icon(
          isRight?Icons.chevron_right:Icons.chevron_left,
          color: Colors.black87,
          size: 24.w,
        ),
      ),
    );
  }
}