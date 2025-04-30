import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:team1_khayat/features/product/models/base_product_model.dart';
import 'package:team1_khayat/features/product/views/product_view.dart';
import 'package:team1_khayat/state_managment/app_pages.dart';
import 'package:team1_khayat/state_managment/app_routers.dart';

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
                   // if(productType == ProductType.fabric)
                   //  Get.toNamed(Routes.productCardPage,
                   //      arguments: FabricProductModel(
                   //        id: "67bf94613024aff9082e7529",
                   //        price: 150.0,
                   //        name: "Cotton Fabric",
                   //        unit: "meter",
                   //        location: "Warehouse A",
                   //        quantity: 120,
                   //        discount: 10.0,
                   //        minStock: 20,
                   //        maxStock: 300,
                   //        active: true,
                   //        createdAt: DateTime.now().subtract(const Duration(days: 10)),
                   //        updatedAt: DateTime.now(),
                   //        ratingsAverage: 4.2,
                   //        ratingsQuantity: 32,
                   //        slug: "cotton-fabric",
                   //        isLowStock: false,
                   //        isOverStocked: false,
                   //        profitMargin: 25.0,
                   //        totalCost: 100.0,
                   //        totalValue: 18000.0,
                   //        category: Category(
                   //          id: "cat01",
                   //          name: "Fabrics",
                   //        ),
                   //        colors: ["Black","Red","Grey"],
                   //        sizes: ["Medium","Large","Small"],
                   //        images: [
                   //          "https://poundfabrics.co.uk/cdn/shop/products/image_1a18827b-88a4-4d0c-913e-e3c295992a8c.jpg?v=1726581130",
                   //          "https://www.calicolaine.co.uk/media/catalog/product/cache/581b2b2dc0199fc97eb70085072d3fba/r/e/red-textured-polyester-twill-fabric_1.jpg",
                   //          "https://www.fabricsgalore.co.uk/cdn/shop/products/PoshCottonCalico1.jpg?v=1588602485"
                   //        ],
                   //        pricePerMeter: 15.0,
                   //      ));
                  },
                  child: ProductCard(productModel: product));
            },
          );
        }
      },
    );
  }
}
