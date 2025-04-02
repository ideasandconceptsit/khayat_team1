import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/custom_app_bar/custom_app_bar.dart';
import 'favorite_controller/favorite_controller.dart';
import 'widgets/product_grid.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final TextEditingController _searchController = TextEditingController();
  bool _showSearch = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final FavoriteController controller = Get.find<FavoriteController>();

    return Scaffold(
      appBar: _showSearch
          ? AppBar(
              automaticallyImplyLeading: false,
              title: TextField(
                controller: _searchController,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'search_favorites'.tr,
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.white70),
                ),
                style: TextStyle(color: Colors.white),
                onChanged: (value) {
                  controller.searchFavorites(value);
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
                      controller.clearSearch();
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
              title: "المفضلة".tr,
            ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  const Expanded(
                    child: FavoriteGrid(),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      controller.addTestFavorites();
                    },
                    child: Icon(Icons.add),
                    tooltip: 'Add test favorites',
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
