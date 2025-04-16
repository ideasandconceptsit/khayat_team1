import 'package:get/get.dart';
import '../../favorites/favorite_controller/favorite_controller.dart';
import '../../favorites/repositories/favorite_repo.dart';
import '../models/product_model.dart';
import '../repositories/product_repoistory.dart';

class ProductControllerCatalog extends GetxController {
  final ProductRepository _repository = Get.find<ProductRepository>();
  final FavoriteRepository _favoriteRepository = Get.find<FavoriteRepository>();
  final RxList<ProductModel> allProducts = <ProductModel>[].obs;
  final RxList<ProductModel> filteredProducts = <ProductModel>[].obs;
  final RxSet<String> likedProducts = <String>{}.obs;
  final RxBool isLoading = false.obs;
  final RxString searchQuery = ''.obs; // أضفنا هذا المتغير للبحث

  final RxDouble minPrice = 0.0.obs;
  final RxDouble maxPrice = 1000.0.obs;
  final Rx<String?> selectedCategory = Rx<String?>(null);
  final Rx<ProductType?> selectedType = Rx<ProductType?>(null);
  final RxString currentSort = 'popular'.obs;

  @override
  void onInit() {
    super.onInit();
  }

  // دالة البحث عن المنتجات
  void searchProducts(String query) {
    searchQuery.value = query.toLowerCase();
    applyFilters();
  }

  // دالة مسح البحث
  void clearSearch() {
    searchQuery.value = '';
    applyFilters();
  }

  Future<void> loadProducts(ProductType productType) async {
    isLoading.value = true;
    try {
      // Load products
      final products = await _repository.getAllProducts(type: productType);
      allProducts.assignAll(products);

      // Load favorites
      final favoritesResponse = productType == ProductType.fabric
          ? await _favoriteRepository.getFavoriteFabrics()
          : await _favoriteRepository.getFavoriteAccessories();
      // Update local favorites list
      likedProducts.clear();
      if (favoritesResponse.data != null) {
        likedProducts.addAll(favoritesResponse.data.map((f) => f.id));
      }

      applyFilters();
    } catch (e) {
      Get.snackbar('Error'.tr, 'Failed to load data'.tr);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> toggleLike(String productId, ProductType productType) async {
    try {
      final favoriteController = Get.find<FavoriteControllerOld>();

      if (likedProducts.contains(productId)) {
        await _favoriteRepository.removeFromFavorites(productId, productType);
        likedProducts.remove(productId);
        // Also remove from favorites list if viewing it
        favoriteController.allFavorites
            .removeWhere((item) => item.id == productId);
      } else {
        await _favoriteRepository.addToFavorites(productId, productType);
        likedProducts.add(productId);
      }
      update();
    } catch (e) {
      Get.snackbar('Error'.tr, 'Failed to update favorites'.tr);
    }
  }

  Future<void> _addToFavorites(
      String productId, ProductType productType) async {
    if (productType == ProductType.fabric) {
      await _favoriteRepository.addFabricToFavorites(productId);
    } else {
      await _favoriteRepository.addAccessoryToFavorites(productId);
    }
  }

  Future<void> _removeFromFavorites(
      String productId, ProductType productType) async {
    if (productType == ProductType.fabric) {
      await _favoriteRepository.removeFabricFromFavorites(productId);
    } else {
      await _favoriteRepository.removeAccessoryFromFavorites(productId);
    }
  }

  bool isLiked(String productId) => likedProducts.contains(productId);

  void applyFilters() {
    filteredProducts.value = allProducts.where((product) {
      // شرط البحث
      final matchesSearch = searchQuery.value.isEmpty ||
          product.name.toLowerCase().contains(searchQuery.value) ||
          product.category.name.toLowerCase().contains(searchQuery.value);

      final price = product.finalPrice;
      final categoryMatch = selectedCategory.value == null ||
          product.category.id == selectedCategory.value;
      final typeMatch =
          selectedType.value == null || product.type == selectedType.value;
      final priceMatch = price >= minPrice.value && price <= maxPrice.value;

      return matchesSearch && categoryMatch && typeMatch && priceMatch;
    }).toList();

    _sortProducts();
    update();
  }

  void _sortProducts() {
    switch (currentSort.value) {
      case 'price_low':
        filteredProducts.sort((a, b) => a.finalPrice.compareTo(b.finalPrice));
        break;
      case 'price_high':
        filteredProducts.sort((a, b) => b.finalPrice.compareTo(a.finalPrice));
        break;
      case 'newest':
        filteredProducts.sort((a, b) => b.createdAt.compareTo(a.createdAt));
        break;
      case 'popular':
      default:
        filteredProducts
            .sort((a, b) => b.ratingsAverage.compareTo(a.ratingsAverage));
    }
  }

  void setCategoryFilter(String? categoryId) {
    selectedCategory.value = categoryId;
    applyFilters();
  }

  void setTypeFilter(ProductType? type) {
    selectedType.value = type;
    applyFilters();
  }

  void setPriceRange(double min, double max) {
    minPrice.value = min;
    maxPrice.value = max;
    applyFilters();
  }

  void applyFiltersAndSort() {
    applyFilters();
  }

  void setSortOption(String option) {
    currentSort.value = option;
    applyFilters();
  }
}
