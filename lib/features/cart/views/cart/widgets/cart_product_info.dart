import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:team1_khayat/features/cart/models/cart_product_model.dart';
import 'package:team1_khayat/features/cart/views/cart/widgets/product_color_and_size_row.dart';
import 'package:team1_khayat/features/cart/views/cart/widgets/product_name_and_more_options.dart';
import 'package:team1_khayat/features/cart/views/cart/widgets/product_quantity_and_price_section.dart';

class CartProductInfo extends StatelessWidget {
  const CartProductInfo({super.key, required this.cartItemModel});
  final CartItemModel cartItemModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: 12.h,
        ),
        child:   Column(
          children: [
            ProductNameAndMoreOptions(cartItemModel: cartItemModel),
            ColorAndSizeRow(color: cartItemModel.color,size:cartItemModel.size,),
            const Spacer(),
            ProductQuantityAndPriceSection(cartItemModel: cartItemModel,),
          ],

        ),
      ),
    );
  }
}




