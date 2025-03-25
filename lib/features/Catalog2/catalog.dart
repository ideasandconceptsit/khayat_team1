import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../shared/custom_app_bar/custom_app_bar.dart';
import 'widgets/category_pills.dart';
import 'widgets/filter_sort_bar.dart';
import 'widgets/product_grid.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          actionIcon: Icons.search,
          actionIconOnPressed: () {},
          arrowBackVisibility: true,
          arrowBackOnPressed: () {
            Get.back();
          },
          backgroundColor: Colors.white,
          title: "womens_tops".tr),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  CategoryPills(),
                  FilterSortBar(),
                  const Expanded(
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
