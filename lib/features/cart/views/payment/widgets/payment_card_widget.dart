import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_assets.dart';
import 'package:team1_khayat/core/app_colors.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/features/cart/models/payment_model.dart';

class PaymentCardWidget extends StatelessWidget {
  const PaymentCardWidget({super.key, required this.paymentModel});

  final PaymentModel paymentModel;

  @override
  Widget build(BuildContext context) {
    if (paymentModel.paymentCardType == PaymentCardType.Visa) {
      return  VisaCardWidget(
        paymentModel: paymentModel,
      );
    } else if (paymentModel.paymentCardType == PaymentCardType.MasterCard) {
      return MasterCardWidget(paymentModel: paymentModel,);
    } else {
      return  Container(color:AppColors.greyColor ,child:  Center(child: Text(AppStrings.unintendedCard)),);
    }
  }


}

class MasterCardWidget extends StatelessWidget {
  const MasterCardWidget({
    super.key,
    required this.paymentModel,
  });

  final PaymentModel paymentModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(AppAssets.masterCard),
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(start: 63.w,top: 100.h),
                child: Text(
                    "* * * *  * * * *  * * * *  ${paymentModel.cardNumber!.substring(12, paymentModel.cardNumber!.length)}",
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
                        Text(paymentModel.nameOnCard!,style: AppTextStyles.textStyleBlack16.copyWith(fontSize: 14.sp,color: AppColors.whiteColor),),
                      ],
                    ),
                  ),
                  SizedBox(width: 74.w,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppStrings.expiryDate,style: AppTextStyles.textStyleBlack16.copyWith(fontSize: 10.sp,color: AppColors.whiteColor.withOpacity(.8)),),
                      Text(paymentModel.expireDate!,style: AppTextStyles.textStyleBlack16.copyWith(fontSize: 14.sp,color: AppColors.whiteColor),),
                    ],
                  ),
                ],
              )
            ])
      ],
    );
  }
}

class VisaCardWidget extends StatelessWidget {
  const VisaCardWidget({super.key, required this.paymentModel});

  final PaymentModel paymentModel;
  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Image.asset(AppAssets.visaCard),
         Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(start: 63.w,top: 100.h),
              child: Text(
                  "* * * *  * * * *  * * * *  ${paymentModel.cardNumber!.substring(12, paymentModel.cardNumber!.length)}",
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
                      Text(paymentModel.nameOnCard!,style: AppTextStyles.textStyleBlack16.copyWith(fontSize: 14.sp,color: AppColors.whiteColor),),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppStrings.expiryDate,style: AppTextStyles.textStyleBlack16.copyWith(fontSize: 10.sp,color: AppColors.whiteColor.withOpacity(.8)),),
                      Text(paymentModel.expireDate!,style: AppTextStyles.textStyleBlack16.copyWith(fontSize: 14.sp,color: AppColors.whiteColor),),
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
