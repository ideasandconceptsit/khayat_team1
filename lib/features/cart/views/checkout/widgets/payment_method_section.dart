import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_assets.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/core/utils/app_colors.dart';
import 'package:team1_khayat/features/cart/controllers/checkout_controller.dart';
import 'package:team1_khayat/features/cart/controllers/payment_controller.dart';
import 'package:team1_khayat/features/cart/models/payment_card_model.dart';
import 'package:team1_khayat/features/cart/views/payment/widgets/add_card_bottom_sheet_widget.dart';
import 'package:team1_khayat/shared/app_bottom_sheet/app_bottom_sheet.dart';
import 'package:team1_khayat/shared/custom_card_with_shadow/custom_card_with_shadow.dart';
import 'package:team1_khayat/state_managment/app_routers.dart';
import 'package:team1_khayat/state_managment/app_status.dart';

class PaymentMethodSection extends StatelessWidget {
   PaymentMethodSection({
    super.key,
  });
  final PaymentController paymentController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () =>  Column(
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
                  child: Obx(
                    () => InkWell(
                      onTap: () {
                        if(paymentController.paymentCardsList.isEmpty){
                          showCustomAppBottomSheet(context,
                              height: 572.h, child:  AddCardBottomSheetWidget());
                        }
                        else
                        {Get.toNamed(Routes.paymentPage);}
                      },
                      child: Text(
                        paymentController.paymentCardsList.isEmpty?AppStrings.add.tr:AppStrings.change.tr,
                        style: AppTextStyles.textStyleMedium14
                            .copyWith(color: AppColors.redColor),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            if(paymentController.getPaymentCardsState.value==AppState.success&&paymentController.paymentCardsList.isNotEmpty)Row(
              children: [
                CustomCardWithShadow(
                    height: 38.h,
                    width: 64.w,
                    child: Image.asset(AppAssets.visaLogo)),
                SizedBox(
                  width: 17.w,
                ),
                Text(
                  paymentController.paymentCardsList.isEmpty?AppStrings.noPaymentMethodAdded.tr:
                  paymentController.hiddenCardNumber.value,
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
    return paymentController
                    .paymentCardsList[
    paymentController.currentPaymentMethodIndex.value]
                    .paymentCardType! ==PaymentCardType.Visa?AppAssets.visaLogo:AppAssets.masterCardLogo;
  }


}
