import 'package:get/get.dart';
import '../../Catalog2/models/product_model.dart';
import '../models/favorite_model.dart';
import '../repositories/favorite_repo.dart';

class FavoriteControllerOld extends GetxController {
  final FavoriteRepository _favoriteRepository = Get.find();
  final RxString searchQuery = ''.obs;
  final RxList<FavoriteItem> filteredFavorites = <FavoriteItem>[].obs;
  var isLoading = false.obs;
  var allFavorites = <FavoriteItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    try {
      isLoading(true);
      final accessories = await _favoriteRepository.getFavoriteAccessories();
      final fabrics = await _favoriteRepository.getFavoriteFabrics();
      allFavorites.assignAll([...accessories.data, ...fabrics.data]);
      applyFilters(); // Update filtered list
    } catch (e) {
      Get.snackbar('Error'.tr, 'Failed to load favorites'.tr);
    } finally {
      isLoading(false);
    }
  }

  Future<void> removeFavorite(String id, ProductType type) async {
    try {
      isLoading(true);

      // Remove based on product type
      if (type == ProductType.accessory) {
        await _favoriteRepository.removeAccessoryFromFavorites(id);
      } else {
        await _favoriteRepository.removeFabricFromFavorites(id);
      }

      // Optimistic update - remove from list before reloading
      allFavorites.removeWhere((item) => item.id == id);
      await loadFavorites();

      Get.snackbar('Success'.tr, 'removed_from_favorites'.tr);
    } catch (e) {
      Get.snackbar('Error'.tr, 'failed_to_remove_favorite'.tr);
      // Revert on error
      await loadFavorites();
    } finally {
      isLoading(false);
    }
  }

  Future<void> addTestFavorites() async {
    try {
      isLoading(true);
      final accessory1 = await _favoriteRepository
          .addAccessoryToFavorites('67d21ee2e1b24c51a27dd7da');
      print('Added accessory 1: $accessory1');

      final accessory2 = await _favoriteRepository
          .addAccessoryToFavorites('67d22017e1b24c51a27dd85c');
      print('Added accessory 2: $accessory2');

      await loadFavorites();
      Get.snackbar('Success', 'Test items added to favorites');
    } catch (e) {
      print('Error adding test favorites: $e');
      Get.snackbar('Error', 'Failed to add test items: $e');
    } finally {
      isLoading(false);
    }
  }

  void searchFavorites(String query) {
    searchQuery.value = query.toLowerCase();
    applyFilters();
  }

  void clearSearch() {
    searchQuery.value = '';
    applyFilters();
  }

  void applyFilters() {
    if (searchQuery.isEmpty) {
      filteredFavorites.assignAll(allFavorites);
    } else {
      filteredFavorites.assignAll(allFavorites.where((item) {
        return item.name.toLowerCase().contains(searchQuery.value) ||
            item.category.name.toLowerCase().contains(searchQuery.value);
      }).toList());
    }
  }

  // Update your loadFavorites to also update filteredFavorites
}
