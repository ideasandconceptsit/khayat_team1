import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/core/utils/app_colors.dart';
import 'package:team1_khayat/features/cart/controllers/checkout_controller.dart';
import 'package:team1_khayat/features/cart/views/payment/widgets/payment_card_and_checkbox.dart';
import 'package:team1_khayat/features/cart/views/payment/widgets/payment_view_fab.dart';
import 'package:team1_khayat/shared/custom_app_bar/custom_app_bar.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const PaymentViewFAB(),
      appBar: CustomAppBar(
        backgroundColor: AppColors.whiteColor,
        title: AppStrings.paymentMethods.tr,
        arrowBackVisibility: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 30.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(start: 16.w, end: 16.w),
              child: Text(
                AppStrings.yourPaymentCards.tr,
                style: AppTextStyles.textStyleBlack16,
              ),
            ),
            Expanded(
                child: Obx(
                  () =>  ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(height: 13.h,),
                      itemBuilder: (context, index) => PaymentCardAndCheckbox(
                            paymentModel:
                                Get.find<CheckoutController>().paymentList[index],
                          ),
                      itemCount:
                          Get.find<CheckoutController>().paymentList.length),
                )),

          ],
        ),
      ),
    );
  }
}




