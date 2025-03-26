import 'package:flutter/material.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/features/cart/models/cart_product_model.dart';
import 'package:team1_khayat/features/cart/views/cart/widgets/cart_more_options_widget.dart';

class ProductNameAndMoreOptions extends StatelessWidget {
  const ProductNameAndMoreOptions({
    super.key,
 required this.cartItemModel,
  });

  final CartItemModel cartItemModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            cartItemModel.product.name,
            style: AppTextStyles.textStyleBlack16,
            overflow: TextOverflow.ellipsis ,
          ),
        ),
         CartMoreOptionsWidget(cartItemModel: cartItemModel)
      ],
    );
  }
}


