import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:team1_khayat/core/app_colors.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/features/profile/model/order_model.dart';

class HeaderOrderDetails extends StatelessWidget {
  const HeaderOrderDetails({super.key, required this.order});
 final OrderModels order;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text.rich(
            TextSpan(
              text: 'Order №${order.orderNumber}',
              style: AppTextStyles.tajawaltextStyle16.copyWith(
                color: AppColors.grey1,
              ),
            ),
          ),
    Text(
  order.createdAt.split('T')[0],
  style: AppTextStyles.tajawaltextStyle14.copyWith(color: AppColors.grey1),
),

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
              text: AppStrings.trackingNumber,
                  style: AppTextStyles.tajawaltextStyle14.copyWith(color: AppColors.grey1),
                  children: [
                    TextSpan(
                      text:   order.client.phone,
                      style: AppTextStyles.tajawaltextStyle14.copyWith(color: Colors.black),
                    ),
                  ],
                ),
              ),
          
          SizedBox(width: 5.w),
         
        ],
            ),
            const Text(
        AppStrings.delivered,
        style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      )
    ]);
  }
}
