import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/features/cart/controllers/cart_controller.dart';
import 'package:team1_khayat/features/cart/models/cart_product_model.dart';
import 'package:team1_khayat/shared/custom_mini_circle_button/custom_mini_circle_button.dart';

class IncreaseDecreaseQuantityButton extends StatelessWidget {
  const IncreaseDecreaseQuantityButton(
      {super.key, required this.cartItemModel, this.isIncrease = true});

  final CartItemModel cartItemModel;
  final bool isIncrease;

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();
    return CustomMiniCircleButton(
      icon: isIncrease ? Icons.add : Icons.remove,
      onTap: () => cartController.updateCartItemQuantity(
          cartItemModel.product.id,
          isIncrease
              ? cartItemModel.quantity.value + 1
              : cartItemModel.quantity.value - 1),
    );
  }
}


