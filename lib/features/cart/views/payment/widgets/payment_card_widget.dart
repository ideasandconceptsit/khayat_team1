import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_assets.dart';
import 'package:team1_khayat/core/utils/app_colors.dart';

import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/features/cart/controllers/payment_controller.dart';
import 'package:team1_khayat/features/cart/models/payment_card_model.dart';

class PaymentCardWidget extends StatelessWidget {
   PaymentCardWidget({super.key, required this.paymentCardModel});

  final PaymentCardModel paymentCardModel;
  final PaymentController paymentController = Get.find<PaymentController>();

  @override
  Widget build(BuildContext context) {
    if (paymentCardModel.id == paymentController.paymentCardsList[paymentController.currentPaymentMethodIndex.value].id) {
      return  ActivePaymentCardWidget(
        paymentCardModel: paymentCardModel,
      );
    } else  {
      return DisabledPaymentCardWidget(paymentCardModel: paymentCardModel,);
    }
  }


}

class ActivePaymentCardWidget extends StatelessWidget {
  const ActivePaymentCardWidget({
    super.key,
    required this.paymentCardModel,
  });

  final PaymentCardModel paymentCardModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(AppAssets.activePaymentCardImage),
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(start: 63.w,top: 100.h),
                child: Text(
                    "* * * *  * * * *  * * * *  ${paymentCardModel.cardNumber!.substring(12, paymentCardModel.cardNumber!.length)}",
                    style: AppTextStyles.textStyleMedium14.copyWith(color: AppColors.whiteColor,fontSize: 24.sp)),),
              SizedBox(height: 43.h,),
              Row(
                children: [
                  Padding(
                    padding:  EdgeInsetsDirectional.only(start: 43.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(AppStrings.cardHolderName,style: AppTextStyles.textStyleBlack16.copyWith(fontSize: 10.sp,color: AppColors.whiteColor.withOpacity(.8)),),
                        Text(paymentCardModel.holderName!,style: AppTextStyles.textStyleBlack16.copyWith(fontSize: 14.sp,color: AppColors.whiteColor),),
                      ],
                    ),
                  ),
                  SizedBox(width: 74.w,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppStrings.expiryDate,style: AppTextStyles.textStyleBlack16.copyWith(fontSize: 10.sp,color: AppColors.whiteColor.withOpacity(.8)),),
                      Text(paymentCardModel.expiryDate,style: AppTextStyles.textStyleBlack16.copyWith(fontSize: 14.sp,color: AppColors.whiteColor),),
                    ],
                  ),
                ],
              )
            ])
      ],
    );
  }
}

class DisabledPaymentCardWidget extends StatelessWidget {
  const DisabledPaymentCardWidget({super.key, required this.paymentCardModel});

  final PaymentCardModel paymentCardModel;
  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Image.asset(AppAssets.disabledPaymentCardImage),
         Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(start: 63.w,top: 100.h),
              child: Text(
                  "* * * *  * * * *  * * * *  ${paymentCardModel.cardNumber!.substring(12, paymentCardModel.cardNumber!.length)}",
                  style: AppTextStyles.textStyleMedium14.copyWith(color: AppColors.whiteColor,fontSize: 24.sp)),),
            SizedBox(height: 43.h,),
            Padding(
              padding:  EdgeInsetsDirectional.symmetric(horizontal: 43.w),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppStrings.cardHolderName,style: AppTextStyles.textStyleBlack16.copyWith(fontSize: 10.sp,color: AppColors.whiteColor.withOpacity(.8)),),
                      Text(paymentCardModel.holderName,style: AppTextStyles.textStyleBlack16.copyWith(fontSize: 14.sp,color: AppColors.whiteColor),),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppStrings.expiryDate,style: AppTextStyles.textStyleBlack16.copyWith(fontSize: 10.sp,color: AppColors.whiteColor.withOpacity(.8)),),
                      Text(paymentCardModel.expiryDate,style: AppTextStyles.textStyleBlack16.copyWith(fontSize: 14.sp,color: AppColors.whiteColor),),
                    ],
                  ),
                ],
              ),
            )

          ],
        )
      ],
    );
  }
}
