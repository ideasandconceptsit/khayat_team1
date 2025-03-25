import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../catalog_controller/filter_controller.dart';
import '../catalog_controller/product_controller.dart';

class SearchDialog extends StatelessWidget {
  final FilterController controller;

  const SearchDialog({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.find<ProductController>();
    final TextEditingController textController = TextEditingController();

    return AlertDialog(
      title: Text(
        'Search Products',
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: textController,
            decoration: InputDecoration(
              hintText: 'Enter search term...',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            onChanged: (value) {
              controller.updateSearchQuery(value);
            },
          ),
          SizedBox(height: 16.h),
          Obx(() => controller.searchQuery.value.isNotEmpty
              ? Text('${controller.filteredBrands.length} results found')
              : SizedBox.shrink()),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            // Apply the search filter
            controller.applyFilters();
            Get.back();
          },
          child: Text('Search'),
        ),
      ],
    );
  }
}
