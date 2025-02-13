import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/category_pills.dart';
import 'widgets/filter_sort_bar.dart';
import 'widgets/product_grid.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios, size: 20.sp),
                    onPressed: () {},
                  ),
                  Text(
                    "Women's tops",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.search, size: 24.sp),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  const CategoryPills(),
                  FilterSortBar(),
                  Expanded(
                    child: ProductGrid(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
