import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/utils/app_colors.dart';
import 'package:team1_khayat/features/cart/controllers/cart_controller.dart';
import 'package:team1_khayat/features/cart/models/cart_product_model.dart';

class IncreaseDecreaseQuantityButton extends StatelessWidget {
  const IncreaseDecreaseQuantityButton({super.key, required this.cartItemModel, this.isIncrease=true});
  final CartItemModel cartItemModel;
  final bool isIncrease;
  @override
  Widget build(BuildContext context) {
    final CartController cartController=Get.find<CartController>();
    return  InkWell(
      onTap:()=> cartController.updateCartItemQuantity(cartItemModel.product.id, isIncrease?cartItemModel.quantity.value+1:cartItemModel.quantity.value-1),
      child: Container(
        padding: EdgeInsets.all(6.w),
        decoration: buildQuantityButtonDecoration(),
        child: Icon(
          isIncrease?Icons.add:Icons.remove,
          color: AppColors.greyColor,
        ),
      ),
    );


  }
  ShapeDecoration buildQuantityButtonDecoration() {
    return ShapeDecoration(
      color: Colors.white,
      shape: const OvalBorder(),
      shadows: [
        BoxShadow(
          color: AppColors.quantityButtonShadowColor,
          blurRadius: 8.r,
          offset: const Offset(0, 4),
          spreadRadius: 0,
        )
      ],
    );
  }
}