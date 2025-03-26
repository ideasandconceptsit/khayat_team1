import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/features/cart/controllers/checkout_controller.dart';
import 'package:team1_khayat/features/cart/views/checkout/widgets/prices_row.dart';
import 'package:team1_khayat/state_managment/app_status.dart';

class PricesSection extends StatelessWidget {
  const PricesSection({super.key, required this.orderPrice});
  final double orderPrice;
  @override
  Widget build(BuildContext context) {
    final CheckoutController checkoutController = Get.find<CheckoutController>();
    return  Obx(
      () {
        if(checkoutController.getDeliveryMethodsState.value==AppState.loading) {
          return const PricesSkeletonizer();
        }
        else if(checkoutController.getDeliveryMethodsState.value==AppState.error) {
          return  Text(AppStrings.someThingWentWrong.tr);
        }
        double deliveryPrice=0;
        if(checkoutController.deliveryMethods.isNotEmpty){
          deliveryPrice=checkoutController.deliveryMethods[checkoutController.currentDeliveryMethodIndex.value].price;
        }
        double summaryPrice = orderPrice+deliveryPrice;

        return Column(
        children: [
          PriceRow(title: AppStrings.order.tr,price: orderPrice.toString(),),
          SizedBox(height: 14.h,),
          PriceRow(title: AppStrings.delivery.tr,price: checkoutController.deliveryMethods[checkoutController.currentDeliveryMethodIndex.value].price.toString(),),
          SizedBox(height: 14.h,),
          PriceRow(title: AppStrings.summary.tr,price: summaryPrice.toString(),isTextBold: true,),
        ],
      );
      },
    );
    
    
  }
}
class PricesSkeletonizer extends StatelessWidget {
  const PricesSkeletonizer({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Column(
        children: [
          PriceRow(title: AppStrings.order.tr,price: "orderPrice.toString()",),
          SizedBox(height: 14.h,),
          PriceRow(title: AppStrings.delivery.tr,price: "deliveryPrice.toString()",),
          SizedBox(height: 14.h,),
          PriceRow(title: AppStrings.summary.tr,price: "deliveryPrice.toString()",isTextBold: true,),
        ],
      ),
    );
  }
}
