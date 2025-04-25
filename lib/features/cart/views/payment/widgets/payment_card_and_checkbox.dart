import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/utils/app_colors.dart';

import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/features/cart/controllers/payment_controller.dart';
import 'package:team1_khayat/features/cart/models/payment_card_model.dart';
import 'package:team1_khayat/features/cart/views/payment/widgets/payment_card_widget.dart';
import 'package:team1_khayat/features/cart/views/payment/widgets/payment_checkbox.dart';

class PaymentCardAndCheckbox extends StatelessWidget {
  const PaymentCardAndCheckbox({
    super.key,
    required this.paymentCardModel,
  });

  final PaymentCardModel paymentCardModel;

  @override
  Widget build(BuildContext context) {
    PaymentController paymentController = Get.find<PaymentController>();
    return Obx(
          () => Column(
        children: [
          PaymentCardWidget(paymentCardModel: paymentCardModel),
          Padding(
            padding:  EdgeInsetsDirectional.only(start: 16.w),
            child: Row(
              children: [
                PaymentCheckbox(
                  onTap:()=> paymentController.changeDefaultPaymentMethod(paymentController.paymentCardsList.indexOf(paymentCardModel)),
                  isSelected: paymentCardModel.id ==
                      paymentController
                          .paymentCardsList[
                      paymentController.currentPaymentMethodIndex.value]
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