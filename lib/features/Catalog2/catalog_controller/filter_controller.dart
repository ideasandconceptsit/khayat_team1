import 'package:get/get.dart';
import 'package:flutter/material.dart';

class FilterController extends GetxController {
  final RxDouble minPrice = 78.0.obs;
  final RxDouble maxPrice = 143.0.obs;
  final RxList<String> selectedSizes = <String>[].obs;
  final RxList<String> selectedCategories = <String>[].obs;
  final RxList<String> selectedColors = <String>[].obs;
  final RxList<String> selectedBrands = <String>[].obs;

  final RxList<String> brands = <String>[
    'adidas',
    'adidas Originals',
    'Blend',
    'Boutique Moschino',
    'Champion',
    'Diesel',
    'Jack & Jones',
    'Naf Naf',
    'Red Valentino',
    's.Oliver',
  ].obs;

  final List<String> sizes = ['XS', 'S', 'M', 'L', 'XL'];
  final List<String> categories = ['All', 'Women', 'Men', 'Boys', 'Girls'];
  final List<Map<String, dynamic>> colors = [
    {'name': 'Black', 'color': 0xFF000000},
    {'name': 'White', 'color': 0xFFFFFFFF},
    {'name': 'Red', 'color': 0xFFDB3022},
    {'name': 'Beige', 'color': 0xFFBEABA1},
    {'name': 'Navy', 'color': 0xFF1B1E3D},
  ];

  final RxString searchQuery = ''.obs;

  RxList<String> get filteredBrands => brands
      .where((brand) =>
          brand.toLowerCase().contains(searchQuery.value.toLowerCase()))
      .toList()
      .obs;

  void updatePriceRange(RangeValues values) {
    minPrice.value = values.start;
    maxPrice.value = values.end;
  }

  void toggleSize(String size) {
    if (selectedSizes.contains(size)) {
      selectedSizes.remove(size);
    } else {
      selectedSizes.add(size);
    }
  }

  void toggleCategory(String category) {
    if (selectedCategories.contains(category)) {
      selectedCategories.remove(category);
    } else {
      selectedCategories.add(category);
    }
  }

  void toggleColor(String color) {
    if (selectedColors.contains(color)) {
      selectedColors.remove(color);
    } else {
      selectedColors.add(color);
    }
  }

  void toggleBrand(String brand) {
    if (selectedBrands.contains(brand)) {
      selectedBrands.remove(brand);
    } else {
      selectedBrands.add(brand);
    }
  }

  void updateSearchQuery(String query) {
    searchQuery.value = query;
  }

  void applyFilters() {
    Get.back();
  }

  void resetFilters() {
    selectedSizes.clear();
    selectedCategories.clear();
    selectedColors.clear();
    minPrice.value = 78.0;
    maxPrice.value = 143.0;
    resetBrands();
  }

  void resetBrands() {
    selectedBrands.clear();
    searchQuery.value = '';
  }
}
