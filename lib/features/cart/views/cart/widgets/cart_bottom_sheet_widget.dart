import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_colors.dart';
import 'package:team1_khayat/core/app_constants.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/features/cart/controllers/cart_controller.dart';
import 'package:team1_khayat/features/cart/views/cart/widgets/promo_code.dart';
import 'package:team1_khayat/features/cart/views/cart/widgets/promo_code_item_widget.dart';
import 'package:team1_khayat/shared/custom_card_with_shadow/custom_card_with_shadow.dart';

class CartBottomSheetWidget extends StatelessWidget {
  const CartBottomSheetWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const PromoCode(
        isBottomSheet: true,
      ),
      SizedBox(
        height: 32.h,
      ),
      Align(
        alignment: AlignmentDirectional.centerStart,
        child: Text(
          AppStrings.yourPromoCodes.tr,
          style: AppTextStyles.textStyleBlack18,
        ),
      ),
      SizedBox(
        height: 18.h,
      ),
      Expanded(child: Obx(
            () {
          CartController cartController = Get.find<CartController>();
          return ListView.separated(
              itemBuilder: (context, index) {
                return CustomCardWithShadow(
                    height: 80.h,
                    width: double.infinity,
                    child: PromoCodeItemWidget(
                      promoCodeModel: cartController.promCodeList[index],
                    ));
              },
              separatorBuilder: (context, index) => SizedBox(
                height: 24.h,
              ),
              itemCount: cartController.promCodeList.length);
        },
      ))
    ]);
  }
}