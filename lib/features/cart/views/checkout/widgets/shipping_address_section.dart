import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_colors.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/features/cart/models/shipping_address_model.dart';
import 'package:team1_khayat/shared/custom_card_with_shadow/custom_card_with_shadow.dart';

class ShippingAddressSection extends StatelessWidget {
  const ShippingAddressSection({super.key, required this.shippingAddressModel});
  final ShippingAddressModel? shippingAddressModel;

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.shippingAddress.tr,
          style: AppTextStyles.textStyleBlack16,
        ),
        SizedBox(
          height: 19.h,
        ),
        CustomCardWithShadow(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 28.w,vertical: 18.h),
            height: 108.h,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      //todo: need to refactor
                      shippingAddressModel?.fullName??"",
                      style: AppTextStyles.textStyleMedium14,
                    ),
                    InkWell(
                      onTap: (){},
                      child: Text(
                        AppStrings.change.tr,
                        style: AppTextStyles.textStyleMedium14.copyWith(color: AppColors.redColor),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                //todo: need to refactor
                Text(shippingAddressModel?.address??"",style: AppTextStyles.textStyleRegular14.copyWith(color: AppColors.blackColor),),
                Text("${shippingAddressModel?.city??""}, ${shippingAddressModel?.country??""}",style: AppTextStyles.textStyleRegular14.copyWith(color: AppColors.blackColor)),
              ],
            )),
      ],
    );
  }
}