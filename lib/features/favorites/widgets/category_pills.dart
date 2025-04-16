import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../favorite_controller/filter_controller.dart';
import '../favorite_controller/favorite_controller.dart';
import '../models/category_model.dart';

class CategoryPills extends StatelessWidget {
  CategoryPills({super.key});

  final FavoriteFilterController filterController =
      Get.find<FavoriteFilterController>();
  final FavoriteControllerOld favoriteController = Get.find<FavoriteControllerOld>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      filterController.refreshCounter.value;

      if (filterController.categories.isEmpty) {
        return SizedBox.shrink();
      }

      return Container(
        height: 40.h,
        margin: EdgeInsets.symmetric(vertical: 8.h),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          itemCount: filterController.categories.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return _buildCategoryPill(
                'all'.tr,
                filterController.selectedCategory.value == null,
                () {
                  filterController.toggleCategory(null);
                  //   favoriteController.setCategory(null);
                  print('Selected All category');
                },
              );
            }

            CategoryModel category = filterController.categories[index - 1];
            return _buildCategoryPill(
              category.name,
              filterController.isCategorySelected(category.id),
              () {
                filterController.toggleCategory(category.id);
                //   favoriteController.setCategory(category.id);
                print('Selected category: ${category.name} (${category.id})');
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
        onPressed: () {
          onPressed();
          print('Category pill pressed: $text');
          print(
              'Selected category: ${filterController.selectedCategory.value}');
        },
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
