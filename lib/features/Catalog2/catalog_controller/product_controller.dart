import 'package:get/get.dart';
import '../models/fabric_model.dart';
import '../repositories/fabric_repoistory.dart';

class ProductController extends GetxController {
  final FabricRepository _fabricRepository = Get.find<FabricRepository>();

  final RxList<FabricModel> allFabrics = <FabricModel>[].obs;
  final RxList<FabricModel> filteredFabrics = <FabricModel>[].obs;
  final RxSet<String> likedFabrics = <String>{}.obs;
  final RxBool isLoading = false.obs;

  // Add these new properties
  final RxDouble minPrice = 0.0.obs;
  final RxDouble maxPrice = 200.0.obs;
  final Rx<String?> selectedCategory = Rx<String?>(null);
  final RxString currentSort = 'popular'.obs;

  @override
  void onInit() {
    super.onInit();
    fetchFabrics();
  }

  Future<void> fetchFabrics() async {
    isLoading.value = true;
    try {
      final fetchedFabrics = await _fabricRepository.getAllFabrics();
      allFabrics.assignAll(fetchedFabrics);
      applyFiltersAndSort();
      print('Fetched ${fetchedFabrics.length} fabrics');
    } catch (e) {
      print('Error fetching fabrics: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void toggleLike(String fabricId) {
    if (likedFabrics.contains(fabricId)) {
      likedFabrics.remove(fabricId);
    } else {
      likedFabrics.add(fabricId);
    }
    update();
  }

  bool isLiked(String fabricId) {
    return likedFabrics.contains(fabricId);
  }

  void applyFiltersAndSort() {
    filteredFabrics.value = allFabrics.where((fabric) {
      bool categoryMatch = selectedCategory.value == null ||
          fabric.category.id == selectedCategory.value;
      bool priceMatch = fabric.pricePerMeter >= minPrice.value &&
          fabric.pricePerMeter <= maxPrice.value;
      return categoryMatch && priceMatch;
    }).toList();

    switch (currentSort.value) {
      case 'price_low':
        filteredFabrics
            .sort((a, b) => a.pricePerMeter.compareTo(b.pricePerMeter));
        break;
      case 'price_high':
        filteredFabrics
            .sort((a, b) => b.pricePerMeter.compareTo(a.pricePerMeter));
        break;
      case 'newest':
        filteredFabrics.sort((a, b) => b.createdAt.compareTo(a.createdAt));
        break;
      case 'popular':
      default:
        break;
    }

    update();
  }

  void setCategory(String? categoryId) {
    selectedCategory.value = categoryId;
    applyFiltersAndSort();
  }

  void setPriceRange(double min, double max) {
    minPrice.value = min;
    maxPrice.value = max;
    applyFiltersAndSort();
  }

  void changeSort(String sortOption) {
    currentSort.value = sortOption;
    applyFiltersAndSort();
  }
}
