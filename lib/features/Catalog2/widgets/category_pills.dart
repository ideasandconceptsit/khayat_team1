import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../catalog_controller/filter_controller.dart';
import '../catalog_controller/product_controller.dart';
import '../models/category_model.dart';
import '../models/product_model.dart';

class CategoryPills extends StatelessWidget {
  CategoryPills({super.key});

  final FilterController filterController = Get.find<FilterController>();
  final ProductControllerCatalog productController = Get.find<ProductControllerCatalog>();

  @override
  Widget build(BuildContext context) {
    final ProductType productType = Get.arguments ?? ProductType.fabric;

    return Obx(() {
      filterController.refreshCounter.value;

      // تصفية الفئات حسب نوع المنتج
      final filteredCategories = filterController.categories.where((category) {
        return category.productType == productType;
      }).toList();

      if (filteredCategories.isEmpty) {
        return SizedBox.shrink();
      }

      return Container(
        height: 40.h,
        margin: EdgeInsets.symmetric(vertical: 8.h),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          itemCount: filteredCategories.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return _buildCategoryPill(
                'all'.tr,
                filterController.selectedCategory.value == null,
                () {
                  filterController.toggleCategory(null);
                  productController.setCategoryFilter(null);
                },
              );
            }

            CategoryModel category = filteredCategories[index - 1];
            return _buildCategoryPill(
              category.name,
              filterController.isCategorySelected(category.id),
              () {
                filterController.toggleCategory(category.id);
                productController.setCategoryFilter(category.id);
              },
            );
          },
        ),
      );
    });
  }

  Widget _buildCategoryPill(
      String text, bool isSelected, VoidCallback onPressed) {
    return Container(
      margin: EdgeInsets.only(right: 8.w),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.black : Colors.white,
          foregroundColor: isSelected ? Colors.white : Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
            side: BorderSide(color: Colors.black),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
          ),
        ),
      ),
    );
  }
}
