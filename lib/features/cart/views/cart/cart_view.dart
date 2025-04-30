import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/features/cart/controllers/cart_controller.dart';
import 'package:team1_khayat/features/cart/views/cart/widgets/cart_view_body.dart';
import 'package:team1_khayat/shared/custom_app_bar/custom_app_bar.dart';

class CartView extends StatelessWidget {
  CartView({super.key});

  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: const CustomAppBar(
        actionIcon: Icons.search_rounded,
      ),
      body: CartViewBody(),

      // bottomNavigationBar
      // The implementation of bottomNavigationBar will be in the layout, so there's no need to implement it in all features.
    );
  }
}

