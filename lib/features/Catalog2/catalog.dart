import 'package:flutter/material.dart';

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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios, size: 20),
                    onPressed: () {},
                  ),
                  const Text(
                    "Women's tops",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.search, size: 24),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  const CategoryPills(),
                  const FilterSortBar(),
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
