import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/features/Catalog2/filter.dart';
import 'package:team1_khayat/features/Catalog2/widgets/sort_by.dart';

import '../catalog_controller/sort_controller.dart';

class FilterSortBar extends StatelessWidget {
  FilterSortBar({super.key});

  final SortController sortController = Get.put(SortController());

  void showSortOptions() {
    Get.bottomSheet(
      SortBottomSheet(
        currentSort: sortController.currentSort.value,
        onSort: (value) {
          sortController.changeSort(value);
        },
      ),
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
            label: Text('filters'.tr),
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.secondary,
            ),
          ),
          Obx(() => TextButton.icon(
                onPressed: showSortOptions,
                icon: Icon(Icons.import_export, size: 20.sp),
                label: Text(sortController.sortText),
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.secondary,
                ),
              )),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.grid_view, size: 20.sp),
            color: Theme.of(context).colorScheme.secondary,
          ),
        ],
      ),
    );
  }
}
