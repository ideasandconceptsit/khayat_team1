import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/features/main2/model/accessories_model.dart';
import 'package:team1_khayat/features/main2/views/widget/accessories_item_card.dart';
import 'package:team1_khayat/features/product/models/base_product_model.dart' as base;
import 'package:team1_khayat/state_managment/app_routers.dart';

class AccessoriesItemList extends StatelessWidget {
  const   AccessoriesItemList({super.key, required this.accessoriesList});
      final List<ProductAccessories> accessoriesList ;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280.h,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: accessoriesList.length,
        itemBuilder: (context, index) {
          return InkWell(
              onTap: (){
                ///todo
                Get.toNamed(Routes.productCardPage,
                    arguments: base.FabricProductModel(
                      id: "67bf94613024aff9082e7529",
                      price: 150.0,
                      name: "Cotton Fabric",
                      unit: "meter",
                      location: "Warehouse A",
                      quantity: 120,
                      discount: 10.0,
                      minStock: 20,
                      maxStock: 300,
                      active: true,
                      createdAt: DateTime.now().subtract(const Duration(days: 10)),
                      updatedAt: DateTime.now(),
                      ratingsAverage: 4.2,
                      ratingsQuantity: 32,
                      slug: "cotton-fabric",
                      isLowStock: false,
                      isOverStocked: false,
                      profitMargin: 25.0,
                      totalCost: 100.0,
                      totalValue: 18000.0,
                      category: base.Category(
                        id: "cat01",
                        name: "Fabrics",
                      ),
                      images: [
                        // "https://www.tessutidelarte.com/media/catalog/product/cache/e4d64343b1bc593f1c5348fe05efa4a6/_/d/_dsc7422.jpg",
                        //  "https://www.fabricsgalore.co.uk/cdn/shop/products/PoshCottonCalico1.jpg?v=1588602485",
                        //"https://m.media-amazon.com/images/I/61rDuVsVmRL._AC_SL1001_.jpg"

                        "assets/images/Brown.jpeg",
                        "assets/images/Gray.jpeg",
                        "assets/images/Light_Brown.jpeg",
                        "assets/images/Petroleum.jpeg","assets/images/Black.jpeg",
                      ],
                      pricePerMeter: 15.0,
                    ));

              },
              child: AccessoriesItemCard( productAccessoriesItem: accessoriesList[index]));
        },
      ),
    );
  }
}