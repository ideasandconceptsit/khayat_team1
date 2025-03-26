import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_colors.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/features/cart/controllers/cart_controller.dart';

class TotalPrices extends StatelessWidget {
  const TotalPrices({super.key,});


  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();
    return  Obx(
       () =>  Column(
        children: [
          Row(
            children: [
              Text(
                AppStrings.totalAmount.tr,
                  style: AppTextStyles.textStyleMedium14.copyWith(color: AppColors.greyColor)
              ),
              const Spacer(),
              Obx(
                () =>  Text(
                  cartController.cartProductModel.value?.totalCartPrice.value.toString() ?? '0',
                  style: AppTextStyles.textStyleBlack18,
                ),
              )
            ],
          ),
          if(cartController.cartProductModel.value?.appliedCoupon.value!=null)Row(
            children: [
              Text(
                  AppStrings.totalAmountAfterDiscount.tr,
                  style: AppTextStyles.textStyleMedium14.copyWith(color: AppColors.greyColor)
              ),
              const Spacer(),
              Obx(
                    () =>  Text(
                  cartController.cartProductModel.value?.totalAfterDiscount.value.toString() ?? '0',
                  style: AppTextStyles.textStyleBlack18,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}