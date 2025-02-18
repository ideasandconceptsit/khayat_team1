import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/utils/app_colors.dart';
import 'package:team1_khayat/core/app_constants.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/features/cart/controllers/cart_controller.dart';
import 'package:team1_khayat/features/cart/models/promo_code_model.dart';
import 'package:team1_khayat/shared/custom_app_button/custom_app_button.dart';
import 'package:team1_khayat/shared/custom_cached_network_image/custom_cached_network_image.dart';

class PromoCodeItemWidget extends StatelessWidget {
  const PromoCodeItemWidget({super.key, required this.promoCodeModel});

  final PromoCodeModel promoCodeModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCachedNetworkImage(
            imageUrl: promoCodeModel.imageUrl, height: 80.w, width: 80.w),
        Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 14.w),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //todo:
                      Text(
                        promoCodeModel.title,
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
                        "${promoCodeModel.validityDays} ${AppStrings.daysRemaining.tr}",
                        textAlign: TextAlign.right,
                      style:  AppTextStyles.textStyleRegular11.copyWith(color: AppColors.greyColor),
                      ),
                      const Spacer(),
                      CustomAppButton(
                        text: AppStrings.apply.tr,
                        isTextBold: false,
                        height: 36.h,
                        width: 93.w,
                        onTap: () {
                          Get.find<CartController>().selectPromoCode(promoCodeModel.code);
                        },
                      )
                    ],
                  )
                ],
              ),
            ))
      ],
    );
  }
}