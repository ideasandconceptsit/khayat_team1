import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:team1_khayat/core/utils/app_colors.dart';
import 'package:team1_khayat/core/utils/app_text_style.dart';

class HeaderOrderDetails extends StatelessWidget {
  const HeaderOrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text.rich(
            TextSpan(
              text: 'Order №1947034',
              style: AppStyles.tajawaltextStyle16.copyWith(
                color: AppColors.grey1,
              ),
            ),
          ),
          Text('02-28-2024', style: AppStyles.tajawaltextStyle14),
        ],
      ),
      SizedBox(height: 13.h),
      Padding(
        padding: const EdgeInsets.only(right: 9, left: 29),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
        children: [
          Text.rich(
            TextSpan(
              text: 'Tracking number:',
              style: AppStyles.tajawaltextStyle14.copyWith(
          color: AppColors.white,
              ),
            ),
          ),
          SizedBox(width: 5.w),
          Text.rich(
            TextSpan(
              text: 'IW347543455',
              style: AppStyles.tajawaltextStyle14.copyWith(
          color: AppColors.grey1,
              ),
            ),
          ),
        ],
            ),
            const Text(
        'Delivered',
        style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      )
    ]);
  }
}
