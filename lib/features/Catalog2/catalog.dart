import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../shared/custom_app_bar/custom_app_bar.dart';
import 'catalog_controller/product_controller.dart';
import 'models/product_model.dart';
import 'widgets/category_pills.dart';
import 'widgets/filter_sort_bar.dart';
import 'widgets/product_grid.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  bool _showSearch = false;
  final _searchController = TextEditingController();
  final ProductControllerCatalog _productController = Get.find<ProductControllerCatalog>();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ProductType productType = Get.arguments ?? ProductType.fabric;

    return Scaffold(
      appBar: _showSearch
          ? AppBar(
              automaticallyImplyLeading: false,
              title: TextField(
                controller: _searchController,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'search_products'.tr,
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.white70),
                ),
                style: TextStyle(color: Colors.white),
                onChanged: (value) {
                  _productController.searchProducts(value);
                },
              ),
              backgroundColor: Colors.blue,
              actions: [
                IconButton(
                  icon: Icon(Icons.close, color: Colors.white),
                  onPressed: () {
                    setState(() {
                      _showSearch = false;
                      _searchController.clear();
                      _productController.clearSearch();
                    });
                  },
                ),
              ],
            )
          : CustomAppBar(
              actionIcon: Icons.search,
              actionIconOnPressed: () {
                setState(() {
                  _showSearch = true;
                });
              },
              arrowBackVisibility: true,
              arrowBackOnPressed: () => Get.back(),
              backgroundColor: Colors.white,
              title: productType == ProductType.fabric
                  ? 'fabrics'.tr
                  : 'accessories'.tr,
            ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  if (!_showSearch) CategoryPills(),
                  if (!_showSearch) FilterSortBar(),
                  Expanded(
                    child: ProductGrid(productType: productType),
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
