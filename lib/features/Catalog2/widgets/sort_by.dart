import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'sort_options.dart';

class SortBottomSheet extends StatelessWidget {
  final Function(String) onSort;
  final String currentSort;

  const SortBottomSheet({
    Key? key,
    required this.onSort,
    required this.currentSort,
  }) : super(key: key);

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
          SortOption(
            title: 'popular'.tr,
            value: 'popular',
            isSelected: currentSort == 'popular',
            onTap: onSort,
          ),
          SortOption(
            title: 'newest'.tr,
            value: 'newest',
            isSelected: currentSort == 'newest',
            onTap: onSort,
          ),
          SortOption(
            title: 'customer review'.tr,
            value: 'customer_review',
            isSelected: currentSort == 'customer_review',
            onTap: onSort,
          ),
          SortOption(
            title: 'price lowest to high'.tr,
            value: 'price_low',
            isSelected: currentSort == 'price_low',
            onTap: onSort,
          ),
          SortOption(
            title: 'price highest to low'.tr,
            value: 'price_high',
            isSelected: currentSort == 'price_high',
            onTap: onSort,
          ),
          SizedBox(height: MediaQuery.of(context).padding.bottom + 16.h),
        ],
      ),
    );
  }
}
