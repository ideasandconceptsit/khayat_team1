import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/core/utils/app_colors.dart';
import 'package:team1_khayat/features/cart/controllers/checkout_controller.dart';
import 'package:team1_khayat/features/cart/views/checkout/widgets/delivery_method_section.dart';
import 'package:team1_khayat/features/cart/views/checkout/widgets/payment_method_section.dart';
import 'package:team1_khayat/features/cart/views/checkout/widgets/prices_section.dart';
import 'package:team1_khayat/features/cart/views/checkout/widgets/shipping_address_section.dart';
import 'package:team1_khayat/shared/custom_app_bar/custom_app_bar.dart';
import 'package:team1_khayat/shared/custom_app_button/custom_app_button.dart';

class CheckoutView extends StatelessWidget {
   CheckoutView({super.key});
  final totalPrice= Get.arguments;

  @override
  Widget build(BuildContext context) {
    ///Todo: move CartController and CartRepository to the right place.
    final CheckoutController cartController = Get.put(CheckoutController());    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.checkout.tr,
        arrowBackVisibility: true,
        backgroundColor: AppColors.whiteColor,
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.only(start: 16.w, end: 16.w, top: 30.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ShippingAddressSection(),
            SizedBox(
              height: 55.h,
            ),
            PaymentMethodSection(),
            SizedBox(
              height: 50.h,
            ),
            const DeliveryMethodSection(),
            SizedBox(
              height: 52.h,
            ),
            PricesSection(orderPrice: totalPrice,),
            SizedBox(
              height: 18.h,
            ),
            CustomAppButton(text: AppStrings.submitOrder.tr, onTap: () {},height: 48.h,),
          ],
        ),
      ),
    );
  }
}




