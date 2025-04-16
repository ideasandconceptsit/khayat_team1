import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:team1_khayat/features/product/views/product_view.dart';
import 'package:team1_khayat/state_managment/app_pages.dart';

import '../catalog_controller/product_controller.dart';
import '../models/product_model.dart';
import 'product_card.dart';

class ProductGrid extends GetView<ProductControllerCatalog> {
  final ProductType productType;

  const ProductGrid({Key? key, required this.productType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductControllerCatalog>(
      initState: (_) => controller.loadProducts(productType),
      builder: (controller) {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (controller.filteredProducts.isEmpty) {
          return Center(child: Text('no_products_available'.tr));
        } else {
          return GridView.builder(
            padding: EdgeInsets.all(16.w),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.55,
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 16.h,
            ),
            itemCount: controller.filteredProducts.length,
            itemBuilder: (context, index) {
              final product = controller.filteredProducts[index];
              return InkWell(
                  onTap: (){
                    Get.to(() => StartPage() );
                  },
                  child: ProductCard(productModel: product));
            },
          );
        }
      },
    );
  }
}
