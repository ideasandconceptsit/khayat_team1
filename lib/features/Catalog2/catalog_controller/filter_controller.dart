import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../repositories/category_repository.dart';
import '../models/category_model.dart';
import 'product_controller.dart';

class FilterController extends GetxController {
  final CategoryRepository _categoryRepository = Get.find<CategoryRepository>();
  final ProductControllerCatalog productController = Get.find<ProductControllerCatalog>();

  final RxDouble minPrice = 0.0.obs;
  final RxDouble maxPrice = 200.0.obs;

  final RxList<String> selectedSizes = <String>[].obs;
  final RxList<String> selectedColors = <String>[].obs;
  final RxList<String> selectedBrands = <String>[].obs;

  final RxList<String> brands = <String>[].obs;
  final RxList<CategoryModel> categories = <CategoryModel>[].obs;
  final Rx<String?> selectedCategory = Rx<String?>(null);

  final RxInt refreshCounter = 0.obs;

  final List<String> sizes = ['XS', 'S', 'M', 'L', 'XL'];
  final List<Map<String, dynamic>> colors = [
    {'name': 'Black', 'color': 0xFF000000},
    {'name': 'White', 'color': 0xFFFFFFFF},
    {'name': 'Red', 'color': 0xFFDB3022},
    {'name': 'Beige', 'color': 0xFFBEABA1},
    {'name': 'Navy', 'color': 0xFF1B1E3D},
  ];

  final RxString searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
    // TODO: Fetch brands from API when endpoint is available
  }

  Future<void> fetchCategories() async {
    try {
      final fetchedCategories = await _categoryRepository.getAllCategories();
      categories.assignAll(fetchedCategories);
    } catch (e) {
      print('Error fetching categories: $e');
      // Handle error (show snackbar, etc.)
    }
  }

  RxList<String> get filteredBrands => brands
      .where((brand) =>
          brand.toLowerCase().contains(searchQuery.value.toLowerCase()))
      .toList()
      .obs;

  void updatePriceRange(RangeValues values) {
    minPrice.value = values.start;
    maxPrice.value = values.end;
    productController.setPriceRange(values.start, values.end);
  }

  void toggleSize(String size) {
    if (selectedSizes.contains(size)) {
      selectedSizes.remove(size);
    } else {
      selectedSizes.add(size);
    }
  }

  void toggleCategory(String? categoryId) {
    if (selectedCategory.value == categoryId) {
      selectedCategory.value = null;
    } else {
      selectedCategory.value = categoryId;
    }

    refreshCounter.value++;
    productController.selectedCategory(selectedCategory.value);
  }

  bool isCategorySelected(String? categoryId) {
    return selectedCategory.value == categoryId;
  }

  void clearCategorySelection() {
    selectedCategory.value = null;
    refreshCounter.value++;
    Get.find<ProductControllerCatalog>().applyFiltersAndSort();
  }

  void toggleColor(String color) {
    if (selectedColors.contains(color)) {
      selectedColors.remove(color);
    } else {
      selectedColors.add(color);
    }
  }

  void updateSearchQuery(String query) {
    searchQuery.value = query;
  }

  void applyFilters() {
    productController.applyFiltersAndSort();
    Get.back();
  }

  void resetFilters() {
    selectedSizes.clear();
    selectedColors.clear();
    selectedCategory.value = null;
    minPrice.value = 0.0;
    maxPrice.value = 200.0;
    productController.setPriceRange(0.0, 200.0);
    productController.selectedCategory(null);
    refreshCounter.value++;
  }
}
