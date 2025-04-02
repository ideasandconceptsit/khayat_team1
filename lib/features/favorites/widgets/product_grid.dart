import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../favorite_controller/favorite_controller.dart';
import '../../Catalog2/models/product_model.dart';
import 'product_card.dart'; // For ProductType

class FavoriteGrid extends StatelessWidget {
  const FavoriteGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<FavoriteController>();

    return Obx(() {
      if (controller.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      }
      if (controller.filteredFavorites.isEmpty) {
        return Center(
          child: Text(
            controller.searchQuery.isEmpty
                ? 'no_favorites_yet'.tr
                : 'no_results_found'.tr,
          ),
        );
      }
      return GridView.builder(
        padding: EdgeInsets.all(16.w),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.60,
          crossAxisSpacing: 16.w,
          mainAxisSpacing: 16.h,
        ),
        itemCount: controller.filteredFavorites.length,
        itemBuilder: (context, index) {
          final item = controller.filteredFavorites[index];
          final productType =
              item.unit == 'meter' ? ProductType.fabric : ProductType.accessory;

          return FavoriteProductCard(
            favoriteItem: item,
            onRemove: () => controller.removeFavorite(item.id, productType),
          );
        },
      );
    });
  }
}
