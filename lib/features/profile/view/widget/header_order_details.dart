import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
 import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/core/utils/app_colors.dart';
import 'package:team1_khayat/features/profile/model/order_model.dart';

class HeaderOrderDetails extends StatelessWidget {
  const HeaderOrderDetails({super.key, required this.order, required this.status});
 final OrderModels order;
   final String status;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text.rich(
            TextSpan(
              text: '${AppStrings.order.tr} №${order.orderNumber}',
              style: AppTextStyles.tajawaltextStyle16.copyWith(
                color: AppColors.grey1,
              ),
            ),
          ),
    Text(
  order.createdAt!.toIso8601String().split('T')[0],
  style: AppTextStyles.tajawaltextStyle14.copyWith(color: AppColors.grey1),
),

        ],
      ),
      SizedBox(height: 13.h),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
      children: [
        Text.rich(
              TextSpan(
            text: AppStrings.trackingNumber.tr+": " ,
                style: AppTextStyles.tajawaltextStyle14.copyWith(color: AppColors.grey1),
                children: [
                  TextSpan(
                    text:   order.trackingNumber,
                    style: AppTextStyles.tajawaltextStyle14.copyWith(color: Colors.black),
                  ),
                ],
              ),
            ),

        SizedBox(width: 5.w),

      ],
          ),
      Text(
              order.status.toString(),
              style: TextStyle(
                color: status == AppStrings.delivered.tr
                    ? Colors.green
                    : status == AppStrings.processing.tr
                        ? Colors.orange
                        : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
        ],
      )
    ]);
  }
}
