import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/features/main2/controller/product_controller.dart';
import 'package:team1_khayat/features/main2/views/widget/accessories_item_card.dart';
import 'package:team1_khayat/shared/custom_app_bar/custom_app_bar.dart';
import 'package:team1_khayat/shared/shimmer/redacted_effect.dart';


class AllAccessoriesView extends StatelessWidget {
   AllAccessoriesView({super.key});

    final productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(
        title: 'All Accessories',
        arrowBackVisibility: true,
        arrowBackOnPressed: () {
          Get.back();
        },
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Obx(() {
          if (productController.accessoriesList.isEmpty) {
            return const LoadingShimmerEffect();
          }
          return GridView.builder(
            itemCount: productController.accessoriesList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
          final accessories = productController.accessoriesList[index];
              return GestureDetector(
                 onTap: () {
            //  Get.to(() => DetailsScreen(product: product));  
          },
                child: AccessoriesItemCard(productAccessories: accessories),);
            },
          );
        }),
      ),
    );
  }
}
