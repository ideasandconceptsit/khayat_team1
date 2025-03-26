import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/features/cart/controllers/cart_controller.dart';
import 'package:team1_khayat/features/cart/views/cart/widgets/cart_products_list.dart';
import 'package:team1_khayat/features/cart/views/cart/widgets/empty_cart_widget.dart';
import 'package:team1_khayat/features/cart/views/cart/widgets/promo_code.dart';
import 'package:team1_khayat/features/cart/views/cart/widgets/total_prices.dart';
import 'package:team1_khayat/shared/custom_app_button/custom_app_button.dart';
import 'package:team1_khayat/state_managment/app_routers.dart';
import 'package:team1_khayat/state_managment/app_status.dart';

import 'custom_error_widget.dart';

class CartViewBody extends StatelessWidget {
  CartViewBody({
    super.key,
  });

  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Obx(
          () {
             if (cartController.getCartProductsState.value ==
                AppState.error) {
              return  CustomErrorWidget(title: cartController.getCartProductsErrorMessage.value,retryFunction: cartController.getCartProducts,);
            } else if (cartController.getCartProductsState.value ==
                    AppState.success &&
                cartController.cartProductModel.value!.items.isEmpty) {
              return const EmptyCartWidget();
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 18.h),
                  Text(AppStrings.myCart.tr,
                      style: AppTextStyles.textStyleBold34),
                  SizedBox(height: 17.h),
                  const CartProductsList(),
                  SizedBox(height: 25.h),
                  const PromoCode(),
                  SizedBox(height: 28.h),
                  const TotalPrices(),
                  SizedBox(height: 24.h),
                  CustomAppButton(
                    text: AppStrings.checkOut.tr,
                    onTap: () {
                      Get.toNamed(Routes.checkoutPage,
                          arguments: cartController.cartProductModel.value!
                                  .totalCartPrice.value ??
                              0);
                    },
                    height: 48.h,
                  ),
                  SizedBox(
                    height: 105.h,
                  ),
                ],
              );
            }
          },
        ));
  }
}




