import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/core/utils/app_colors.dart';
import 'package:team1_khayat/features/cart/controllers/cart_controller.dart';
import 'package:team1_khayat/features/cart/models/promo_code_model.dart';
import 'package:team1_khayat/shared/custom_app_button/custom_app_button.dart';
import 'package:team1_khayat/shared/custom_cached_network_image/custom_cached_network_image.dart';
import 'package:team1_khayat/state_managment/app_status.dart';

class PromoCodeItemWidget extends StatelessWidget {
  const PromoCodeItemWidget({super.key, required this.promoCodeModel});

  final PromoCodeModel promoCodeModel;

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();
    return Row(
      children: [
        CustomCachedNetworkImage(
            imageUrl: "https://c8.alamy.com/comp/2G67XFJ/sale-label-tag-with-percentage-sign-discount-offer-tag-shopping-coupon-symbol-vector-shopping-label-2G67XFJ.jpg", height: 80.w, width: 80.w),
        Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 14.w),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        promoCodeModel.name,
                          style:  AppTextStyles.textStyleMedium14
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Text(
                        promoCodeModel.code,
                          style:   AppTextStyles.textStyleRegular11
                      )
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      Text(
                        "${promoCodeModel.expiresAt.difference(DateTime.now()).inDays.toString()} ${AppStrings.daysRemaining.tr}",
                        textAlign: TextAlign.right,
                      style:  AppTextStyles.textStyleRegular11.copyWith(color: AppColors.greyColor),
                      ),
                      const Spacer(),
                      Obx(
                        () =>  CustomAppButton(
                          color: isCurrentCoupon(cartController)?AppColors.greyColor:AppColors.primaryColor,
                          isLoading: ((isCurrentCoupon(cartController))&&cartController.applyCouponState.value==AppState.loading),
                          text: isCurrentCoupon(cartController)?AppStrings.applied.tr:AppStrings.apply.tr,
                          isTextBold: false,
                          height: 36.h,
                          width: 93.w,
                          onTap: isCurrentCoupon(cartController)?null:() {
                            Get.find<CartController>().applyCoupon(promoCodeModel.code,promoCodeModel.id);
                          },
                        ),
                      )
                    ],
                  )
                ],
              ),
            ))
      ],
    );
  }

  bool isCurrentCoupon(CartController cartController) => cartController.cartProductModel.value?.appliedCoupon.value?.id==promoCodeModel.id;
}