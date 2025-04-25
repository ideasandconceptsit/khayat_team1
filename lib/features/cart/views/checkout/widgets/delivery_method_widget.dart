import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:team1_khayat/core/utils/app_colors.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/features/cart/models/delivry_method_model.dart';
import 'package:team1_khayat/shared/custom_cached_network_image/custom_cached_network_image.dart';
import 'package:team1_khayat/shared/custom_card_with_shadow/custom_card_with_shadow.dart';

class DeliveryMethodWidget extends StatelessWidget {
  const DeliveryMethodWidget({super.key, required this.deliveryMethodModel, required this.isSelected});
  final DeliveryMethodModel deliveryMethodModel;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return  Stack(
      alignment: AlignmentDirectional.center,
      children: [
        if(isSelected)CustomCardWithShadow(height: 72.h, width: 102.w, child: Container(color: AppColors.blackColor)),
        CustomCardWithShadow(height: 69.h, width: 99.w, child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomCachedNetworkImage(imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQACepP6q4rvLK966nBCun2zXWrCV6w1u_Vw&s", height: 17.h, width: 61.w),
            SizedBox(height: 10.h,),
            Text( getDaysText(deliveryMethodModel),style: AppTextStyles.textStyleRegular11.copyWith(color: AppColors.greyColor),)
          ],
        )),
      ],
    );
  }
}
String getDaysText(DeliveryMethodModel deliveryMethodModel)=>'${deliveryMethodModel.estimatedDeliveryTime.min} - ${deliveryMethodModel.estimatedDeliveryTime.max} ${deliveryMethodModel.estimatedDeliveryTime.unit}';