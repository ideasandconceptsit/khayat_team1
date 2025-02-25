import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/features/cart/controllers/cart_controller.dart';
import 'package:team1_khayat/features/cart/views/cart/widgets/cart_products_list.dart';
import 'package:team1_khayat/features/cart/views/cart/widgets/promo_code.dart';
import 'package:team1_khayat/features/cart/views/cart/widgets/total_amount.dart';
import 'package:team1_khayat/shared/custom_app_bar/custom_app_bar.dart';
import 'package:team1_khayat/shared/custom_app_button/custom_app_button.dart';
import 'package:team1_khayat/state_managment/app_routers.dart';

class CartView extends StatelessWidget {
  CartView({super.key});

  ///Todo: move CartController and CartRepository to the right place.
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        actionIcon: Icons.search_rounded,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 18.h),
            Text(AppStrings.myCart.tr, style: AppTextStyles.textStyleBold34),
            SizedBox(height: 17.h),
            const CartProductsList(),
            SizedBox(height: 25.h),
            const PromoCode(),
            SizedBox(height: 28.h),
            const TotalAmount(),
            SizedBox(height: 24.h),
            CustomAppButton(
              text: AppStrings.checkOut.tr,
              onTap: () {
                Get.toNamed(Routes.checkoutPage,arguments: cartController.getProductsTotalPrice);
              },
              height: 48.h,
            ),
            SizedBox(
              height: 105.h,
            ),
          ],
        ),
      ),
      // bottomNavigationBar
     // The implementation of bottomNavigationBar will be in the layout, so there's no need to implement it in all features.
    );
  }
}
