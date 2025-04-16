import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/features/profile/model/copun_model.dart';
import 'package:team1_khayat/shared/custom_app_button/custom_app_button.dart';

class CouponCard extends StatelessWidget {
  final CouponModel coupon;

  const CouponCard({Key? key, required this.coupon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(coupon.code ?? AppStrings.noCode.tr,
                style: AppTextStyles.tajawaltextStyle18),
                
            SizedBox(height: 8.h),
            Text(
                "${AppStrings.discount.tr}: ${coupon.discount ?? AppStrings.notAvailable.tr}%",
                style: AppTextStyles.tajawaltextStyle16),
            SizedBox(height: 8.h),
            Row(
              children: [
                Text(AppStrings.expiryDate.tr,
                    style: AppTextStyles.tajawaltextStyle14),
                SizedBox(width: 5.w),
                Text(
                  coupon.expiresAt?.toString() ?? AppStrings.notAvailable.tr,
                  style: AppTextStyles.tajawaltextStyle14
                      .copyWith(color: Colors.red),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            CustomAppButton(text: AppStrings.useCoupon.tr,
                onTap: () { 

                }
            )
          ],
        ),
      ),
    );
  }
}
