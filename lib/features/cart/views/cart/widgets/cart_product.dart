import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:team1_khayat/features/cart/models/cart_product_model.dart';
import 'package:team1_khayat/features/cart/views/cart/widgets/cart_product_info.dart';
import 'package:team1_khayat/shared/custom_cached_network_image/custom_cached_network_image.dart';
import 'package:team1_khayat/shared/custom_card_with_shadow/custom_card_with_shadow.dart';

class CartProduct extends StatelessWidget {
  const CartProduct({super.key, required this.cartItemModel});

  final CartItemModel cartItemModel;

  @override
  Widget build(BuildContext context) {
    return CustomCardWithShadow(
      width: 343.w,
      height: 104.h,
      child: Row(
        children: [
          CustomCachedNetworkImage(
              imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQLagg9G3tN5Kwx6GlKtUNtJRc-ej6U8-x-9LJ9z0RD1S125-w906FmP5PTf_ZwlLu6xQ&usqp=CAU", height: 104.w, width: 104.w),
          CartProductInfo(
            cartItemModel: cartItemModel,
                    ),
        ],
      ),
    );
  }


}


