import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/features/product/models/base_product_model.dart';
import 'package:team1_khayat/features/product/views/widgets/product_card_body.dart';
import 'package:team1_khayat/features/product/views/widgets/write_review_fab.dart';
import 'package:team1_khayat/shared/custom_app_bar/custom_app_bar.dart';

class ProductCardView extends StatelessWidget {
   ProductCardView({super.key});
  final BaseProductModel productModel= Get.arguments;


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(
        title: productModel.name!,
        arrowBackVisibility: true,
        actionIcon:Icons.share,
      ),
      body: ProductCardBody(productModel: productModel,),
    );
  }
}


