import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../catalog_controller/sort_controller.dart';
import 'sort_options.dart';

class SortBottomSheet extends GetView<SortController> {
  const SortBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(34.r),
          topRight: Radius.circular(34.r),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle bar
          Container(
            margin: EdgeInsets.symmetric(vertical: 14.h),
            width: 60.w,
            height: 6.h,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(3.r),
            ),
          ),
          // Title
          Padding(
            padding: EdgeInsets.only(
              left: 16.w,
              right: 16.w,
              bottom: 16.h,
            ),
            child: Text(
              'sort by'.tr,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          // Sort options
          Obx(() => Column(
                children: [
                  SortOption(
                    title: 'popular'.tr,
                    value: 'popular',
                    isSelected: controller.currentSort == 'popular',
                    onTap: controller.changeSort,
                  ),
                  SortOption(
                    title: 'newest'.tr,
                    value: 'newest',
                    isSelected: controller.currentSort == 'newest',
                    onTap: controller.changeSort,
                  ),
                  SortOption(
                    title: 'customer review'.tr,
                    value: 'customer_review',
                    isSelected: controller.currentSort == 'customer_review',
                    onTap: controller.changeSort,
                  ),
                  SortOption(
                    title: 'price lowest to high'.tr,
                    value: 'price_low',
                    isSelected: controller.currentSort == 'price_low',
                    onTap: controller.changeSort,
                  ),
                  SortOption(
                    title: 'price highest to low'.tr,
                    value: 'price_high',
                    isSelected: controller.currentSort == 'price_high',
                    onTap: controller.changeSort,
                  ),
                ],
              )),
          SizedBox(height: MediaQuery.of(context).padding.bottom + 16.h),
        ],
      ),
    );
  }
}
