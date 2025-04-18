import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../catalog_controller/sort_controller.dart';
import '../filter.dart';
import 'sort_by.dart';

class FilterSortBar extends StatelessWidget {
  FilterSortBar({super.key});

  final SortController sortController = Get.find<SortController>();

  void showSortOptions() {
    Get.bottomSheet(
      const SortBottomSheet(),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey[300]!),
          bottom: BorderSide(color: Colors.grey[300]!),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton.icon(
            onPressed: () => Get.to(() => FiltersPage()),
            icon: Icon(Icons.tune, size: 20.sp),
            label: Text(
              'filters'.tr,
              style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w400),
            ),
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.secondary,
            ),
          ),
          Obx(() => TextButton.icon(
                onPressed: showSortOptions,
                icon: Icon(Icons.import_export, size: 20.sp),
                label: Text(sortController.sortText,
                    style: TextStyle(
                        fontSize: 11.sp, fontWeight: FontWeight.w400)),
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.secondary,
                ),
              )),
        ],
      ),
    );
  }
}
