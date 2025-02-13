import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_colors.dart';
import 'package:team1_khayat/core/app_constants.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/features/cart/controllers/cart_controller.dart';

class TotalAmount extends StatelessWidget {
  const TotalAmount({super.key,});


  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Text(
          AppStrings.totalAmount.tr,
            style: AppTextStyles.textStyleMedium14.copyWith(color: AppColors.greyColor)
        ),
        const Spacer(),
        Obx(
          () =>  Text(
            "${Get.find<CartController>().getProductsTotalPrice}\$",
            style: AppTextStyles.textStyleBlack18,
          ),
        )
      ],
    );
  }
}