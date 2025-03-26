import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:team1_khayat/features/cart/controllers/cart_controller.dart';
import 'package:team1_khayat/features/cart/models/cart_product_model.dart';
import 'package:team1_khayat/features/cart/views/cart/widgets/cart_product.dart';

import '../../../../../state_managment/app_status.dart';

class CartProductsList extends StatelessWidget {
  const CartProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    CartController controller = Get.find();
    return Obx(
      () {
        if(controller.getCartProductsState.value == AppState.loading){
          return const CartProductsListSkeleton();
        }
        return Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) => CartProduct(
                    cartItemModel:
                        controller.cartProductModel.value!.items[index],
                  ),
              separatorBuilder: (context, index) => SizedBox(
                    height: 24.h,
                  ),
              itemCount: controller.cartProductModel.value?.items.length ?? 0),
        );
      },
    );
  }
}

class CartProductsListSkeleton extends StatelessWidget {
  const CartProductsListSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Skeletonizer(
        enabled: true,
        child: ListView.separated(
            itemBuilder: (context, index) =>
                CartProduct(
                  cartItemModel: _getDummyCartItemModel(),
                ),
            separatorBuilder: (context, index) =>
                SizedBox(
                  height: 24.h,
                ),
            itemCount: 5),
      ),
    );
  }

  CartItemModel _getDummyCartItemModel() {
    return CartItemModel(
      product: ProductModel(
        id: 'prod_123',
        name: 'Cotton Fabric',
        category: CategoryModel(
          id: 'cat_456',
          name: 'Fabrics',
        ),
        pricePerMeter: 10.5,
      ),
      productType: 'Meter',
      color: 'Blue',
      size: 'L',
      quantity: 3,
      price: 10.5,
      totalPrice: 31.5,
    );
  }
}