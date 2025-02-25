import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/features/cart/controllers/cart_controller.dart';
import 'package:team1_khayat/features/cart/controllers/checkout_controller.dart';
import 'package:team1_khayat/features/cart/views/checkout/widgets/prices_row.dart';

class PricesSection extends StatelessWidget {
  const PricesSection({super.key, required this.orderPrice});
  final double orderPrice;
  @override
  Widget build(BuildContext context) {
    final CheckoutController checkoutController = Get.find<CheckoutController>();
    return  Obx(
      () {
        double delivryPrice=checkoutController.deliveryMethods[checkoutController.currentDeliveryMethodIndex.value].price;
        return Column(
        children: [
          PriceRow(title: AppStrings.order.tr,price: orderPrice.toString(),),
          SizedBox(height: 14.h,),
          PriceRow(title: AppStrings.delivery.tr,price: delivryPrice.toString(),),
          SizedBox(height: 14.h,),
          PriceRow(title: AppStrings.summary.tr,price: (orderPrice+delivryPrice).toString(),isTextBold: true,),
        ],
      );
      },
    );
  }
}