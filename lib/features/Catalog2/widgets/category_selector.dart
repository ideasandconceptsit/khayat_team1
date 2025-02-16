import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../catalog_controller/filter_controller.dart';

class CategorySelector extends StatelessWidget {
  final FilterController controller = Get.find();

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
                children: controller.categories.map((category) {
                  final isSelected =
                      controller.selectedCategories.contains(category);
                  return InkWell(
                    onTap: () => controller.toggleCategory(category),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 8.h,
                      ),
                      decoration: BoxDecoration(
                        color:
                            isSelected ? const Color(0xFF2AA952) : Colors.white,
                        borderRadius: BorderRadius.circular(24.r),
                        border: Border.all(
                          color: isSelected
                              ? Colors.transparent
                              : Colors.grey[300]!,
                        ),
                      ),
                      child: Text(
                        category.tr,
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              )),
        ),
      ],
    );
  }
}
