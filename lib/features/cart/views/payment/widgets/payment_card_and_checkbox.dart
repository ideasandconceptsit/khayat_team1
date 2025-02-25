import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_colors.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/features/cart/controllers/checkout_controller.dart';
import 'package:team1_khayat/features/cart/models/payment_model.dart';
import 'package:team1_khayat/features/cart/views/payment/widgets/payment_card_widget.dart';
import 'package:team1_khayat/features/cart/views/payment/widgets/payment_checkbox.dart';

class PaymentCardAndCheckbox extends StatelessWidget {
  const PaymentCardAndCheckbox({
    super.key,
    required this.paymentModel,
  });

  final PaymentModel paymentModel;

  @override
  Widget build(BuildContext context) {
    CheckoutController checkoutController = Get.find<CheckoutController>();
    return Obx(
          () => Column(
        children: [
          PaymentCardWidget(paymentModel: paymentModel),
          Padding(
            padding:  EdgeInsetsDirectional.only(start: 16.w),
            child: Row(
              children: [
                PaymentCheckbox(
                  onTap:()=> checkoutController.changeDefaultPaymentMethod(checkoutController.paymentList.indexOf(paymentModel)),
                  isSelected: paymentModel.id ==
                      checkoutController
                          .paymentList[
                      checkoutController.currentPaymentMethodIndex.value]
                          .id,
                ),
                SizedBox(
                  width: 13.w,
                ),
                Text(
                  AppStrings.useAsDefaultPayment.tr,
                  style: AppTextStyles.textStyleRegular14
                      .copyWith(color: AppColors.blackColor),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}