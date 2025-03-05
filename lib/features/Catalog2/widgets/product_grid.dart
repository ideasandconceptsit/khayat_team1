import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../catalog_controller/product_controller.dart';
import 'product_card.dart';

class ProductGrid extends GetView<ProductController> {
  const ProductGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      builder: (controller) {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (controller.filteredFabrics.isEmpty) {
          return Center(child: Text('no_fabrics_available'.tr));
        } else {
          return GridView.builder(
            padding: EdgeInsets.all(16.w),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.65,
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 16.h,
            ),
            itemCount: controller.filteredFabrics.length,
            itemBuilder: (context, index) {
              final fabric = controller.filteredFabrics[index];
              return ProductCard(fabric: fabric);
            },
          );
        }
      },
    );
  }
}
