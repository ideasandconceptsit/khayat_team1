import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/features/cart/controllers/cart_controller.dart';
import 'package:team1_khayat/features/cart/models/cart_product_model.dart';
import 'package:team1_khayat/features/cart/views/cart/widgets/cart_increase_decrease_quantity.dart';

class ProductQuantityAndPriceSection extends StatelessWidget {
  const ProductQuantityAndPriceSection({super.key, required this.cartItemModel});

  final CartItemModel cartItemModel;

  @override
  Widget build(BuildContext context) {
     CartController cartController =Get.find<CartController>();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IncreaseDecreaseQuantityButton(cartItemModel: cartItemModel,isIncrease: false,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Obx(
            () {

              return  Text(
                  cartItemModel.quantity.value.toString(),
              style: AppTextStyles.textStyleMedium14
            );
            },
          ),
        ),
        IncreaseDecreaseQuantityButton(cartItemModel: cartItemModel),
        const Spacer(),
        Text('${cartItemModel.price}\$', style: AppTextStyles.textStyleMedium14
        )
      ],
    );
  }
}


