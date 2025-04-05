import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/features/main2/controller/product_controller.dart';
import 'package:team1_khayat/shared/custom_app_bar/custom_app_bar.dart';
import 'package:team1_khayat/shared/shimmer/redacted_effect.dart';
import 'fabric_item_card.dart';


class AllFabricView extends StatelessWidget {
   AllFabricView({super.key});

    final productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(
        title: 'All Fabrics',
        arrowBackVisibility: true,
        arrowBackOnPressed: () {
          Get.back();
        },
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Obx(() {
          if (productController.fabricList.isEmpty) {
            return const LoadingShimmerEffect();
          }
          return GridView.builder(
            itemCount: productController.fabricList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
          final fabric = productController.fabricList[index];
              return GestureDetector(
                 onTap: () {
            //  Get.to(() => DetailsScreen(product: product));  
          },
                child: FabricItemCard(fabricItem: fabric),);
            },
          );
        }),
      ),
    );
  }
}
