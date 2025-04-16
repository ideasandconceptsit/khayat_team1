import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/core/utils/app_colors.dart';
import 'package:team1_khayat/features/cart/controllers/cart_controller.dart';
import 'package:team1_khayat/features/cart/views/cart/widgets/promo_code_suffix_icon.dart';

class PromoCode extends StatelessWidget {
   const PromoCode({super.key, this.isBottomSheet = false});

  final bool isBottomSheet;
  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();

    return SizedBox(
      height: 36.h,
      child: TextField(
        controller: cartController.promoCodeController,
        decoration: _buildFormFiledInputDecoration(),
      ),
    );
  }

  InputDecoration _buildFormFiledInputDecoration() {
    return InputDecoration(
          hintText: AppStrings.enterYourPromoCode.tr,
          hintStyle: AppTextStyles.textStyleMedium14.copyWith(color: AppColors.greyColor),
          filled: true,
          fillColor: Colors.white,
          border: _getOutlineInputBorder(),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.w),
          suffixIconConstraints:
              BoxConstraints(maxHeight: 36.h, maxWidth: 36.w),
          suffixIcon: PromoCodeSuffixIcon(
                isBottomSheet: isBottomSheet,
              ));
  }

  OutlineInputBorder _getOutlineInputBorder() {
    return OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide.none,
        );
  }
}




