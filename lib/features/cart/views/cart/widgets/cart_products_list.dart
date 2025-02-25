import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/features/cart/controllers/cart_controller.dart';
import 'package:team1_khayat/features/cart/views/cart/widgets/cart_product.dart';

class CartProductsList extends StatelessWidget {
  const CartProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    CartController controller=Get.find();
    return Obx(()  {
        return Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) => CartProduct(
                cartProductModel: controller.cartProducts[index],
              ),
              separatorBuilder: (context, index) => SizedBox(
                    height: 24.h,
                  ),
              itemCount: controller.cartProducts.length),
        );
      },
    );
  }
}
