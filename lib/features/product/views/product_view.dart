import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/features/product/models/product_card_arguments.dart';
import 'package:team1_khayat/features/product/views/widgets/product_card_body.dart';
import 'package:team1_khayat/shared/custom_app_bar/custom_app_bar.dart';

class ProductCardView extends StatelessWidget {
   ProductCardView({super.key});
  final ProductCardArgument productCardArgument= Get.arguments;


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(
        title: productCardArgument.fabricProductModel?.name??productCardArgument.accessoryProductModel?.name??"",
        arrowBackVisibility: true,
        actionIcon:Icons.share,
      ),
      body: const ProductCardBody(),
    );
  }
}
