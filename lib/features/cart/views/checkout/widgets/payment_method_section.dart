import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_assets.dart';
import 'package:team1_khayat/core/app_colors.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/features/cart/controllers/checkout_controller.dart';
import 'package:team1_khayat/features/cart/models/payment_model.dart';
import 'package:team1_khayat/shared/custom_card_with_shadow/custom_card_with_shadow.dart';
import 'package:team1_khayat/state_managment/app_routers.dart';

class PaymentMethodSection extends StatelessWidget {
  const PaymentMethodSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    CheckoutController checkoutController = Get.find<CheckoutController>();
    return Obx(
      () => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.payment.tr,
                style: AppTextStyles.textStyleBlack16,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(end: 28.w),
                child: InkWell(
                  onTap: () {
                    Get.toNamed(Routes.paymentPage);
                  },
                  child: Text(
                    AppStrings.change.tr,
                    style: AppTextStyles.textStyleMedium14
                        .copyWith(color: AppColors.redColor),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          Row(
            children: [
              CustomCardWithShadow(
                  height: 38.h,
                  width: 64.w,
                  child: Image.asset(getImagePath(checkoutController))),
              SizedBox(
                width: 17.w,
              ),
              Text(
                _getCardNumber(checkoutController.paymentList[
                    checkoutController.currentPaymentMethodIndex.value]),
                style: AppTextStyles.textStyleRegular14
                    .copyWith(color: AppColors.blackColor),
              )
            ],
          )
        ],
      ),
    );
  }

  String getImagePath(CheckoutController checkoutController) {
    return checkoutController
                    .paymentList[
                checkoutController.currentPaymentMethodIndex.value]
                    .paymentCardType! ==PaymentCardType.Visa?AppAssets.visaLogo:AppAssets.masterCardLogo;
  }

  String _getCardNumber(PaymentModel currentPaymentModel) {
    return "**** **** **** ${currentPaymentModel.cardNumber?.substring(12, currentPaymentModel.cardNumber?.length)}";
  }
}
