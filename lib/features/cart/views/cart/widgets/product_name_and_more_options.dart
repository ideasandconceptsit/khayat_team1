import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_colors.dart';
import 'package:team1_khayat/core/app_constants.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/features/cart/controllers/cart_controller.dart';
import 'package:team1_khayat/features/cart/models/cart_product_model.dart';
import 'package:team1_khayat/features/cart/views/cart/widgets/cart_more_options_widget.dart';

class ProductNameAndMoreOptions extends StatelessWidget {
  const ProductNameAndMoreOptions({
    super.key,
 required this.cartProductModel,
  });

  final CartProductModel cartProductModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          cartProductModel.title,
          style: AppTextStyles.textStyleBlack16,
        ),
        const Spacer(),
         CartMoreOptionsWidget(cartProductModel:cartProductModel)
      ],
    );
  }
}


