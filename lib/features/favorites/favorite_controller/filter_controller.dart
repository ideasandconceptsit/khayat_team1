// filter_controller.dart
import 'package:get/get.dart';
import '../models/category_model.dart';
import '../repositories/category_repository.dart';

class FavoriteFilterController extends GetxController {
  final FavoriteCategoryRepository _categoryRepository = Get.find();

  var categories = <CategoryModel>[].obs;
  var selectedCategory = Rx<String?>(null);
  var refreshCounter = 0.obs;

  @override
  void onInit() {
    super.onInit();
    loadCategories();
  }

  Future<void> loadCategories() async {
    try {
      final result = await _categoryRepository.getAllCategories();
      categories.assignAll(result);
    } catch (e) {
      Get.snackbar('Error', 'Failed to load categories');
    }
  }

  void toggleCategory(String? categoryId) {
    selectedCategory.value =
        selectedCategory.value == categoryId ? null : categoryId;
    refreshCounter.value++;
  }

  bool isCategorySelected(String? categoryId) {
    return selectedCategory.value == categoryId;
  }
}
