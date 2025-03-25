import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../catalog_controller/filter_controller.dart';
import '../catalog_controller/product_controller.dart';
import '../models/category_model.dart';

class CategorySelector extends StatelessWidget {
  final FilterController filterController = Get.find();
  final ProductController productController = Get.find();

  CategorySelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            'category'.tr,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: 16.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Obx(() => Wrap(
                spacing: 8.w,
                runSpacing: 8.h,
                children: [
                  _buildCategoryChip(
                    'all'.tr,
                    filterController.selectedCategory.value == null,
                    () {
                      filterController.toggleCategory(null);
                      productController.setCategory(null);
                    },
                  ),
                  ...filterController.categories.map((CategoryModel category) {
                    final isSelected =
                        filterController.isCategorySelected(category.id);
                    return _buildCategoryChip(
                      category.name,
                      isSelected,
                      () {
                        filterController.toggleCategory(category.id);
                        productController.setCategory(category.id);
                      },
                    );
                  }).toList(),
                ],
              )),
        ),
      ],
    );
  }

  Widget _buildCategoryChip(String label, bool isSelected, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 8.h,
        ),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF2AA952) : Colors.white,
          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(
            color: isSelected ? Colors.transparent : Colors.grey[300]!,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontSize: 14.sp,
          ),
        ),
      ),
    );
  }
}
