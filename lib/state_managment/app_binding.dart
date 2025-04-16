import 'package:get/get.dart';
import 'package:team1_khayat/features/Catalog2/repositories/product_repoistory.dart';
import 'package:team1_khayat/features/favorites/favorite_controller/favorite_controller.dart';
import 'package:team1_khayat/features/favorites/favorite_controller/filter_controller.dart';
import 'package:team1_khayat/features/favorites/repositories/category_repository.dart';
import 'package:team1_khayat/features/favorites/repositories/favorite_repo.dart';

import '../core/services/api_service.dart';
import '../core/translations/language_controller.dart';
import '../features/Catalog2/catalog_controller/filter_controller.dart';
import '../features/Catalog2/catalog_controller/product_controller.dart'as catalog;
import '../features/Catalog2/catalog_controller/sort_controller.dart';
import '../features/Catalog2/repositories/category_repository.dart';
import '../features/profile/controller/language_controller.dart';
import 'app_state_controller.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<AppStateController>(AppStateController());
    Get.put<LanguageController>(LanguageController());
    Get.put(ApiService(), permanent: true);
    final apiService = Get.put(ApiService(), permanent: true);

    // Catalog dependencies
    Get.put(CategoryRepository(), permanent: true);
    Get.put(ProductRepository(), permanent: true);

    // Favorite dependencies - Initialize FIRST
    Get.put(
      FavoriteRepository(apiService: apiService),
      permanent: true,
    );
    Get.lazyPut(() => FavoriteCategoryRepository());

    // Then initialize controllers that depend on repositories
    Get.put(catalog.ProductControllerCatalog());
    Get.put(FilterController());
    Get.put(SortController());
    Get.lazyPut(() => FavoriteControllerOld());
    Get.lazyPut(() => FavoriteFilterController());
    // Get.put(FabricRepository(), permanent: true);

  }
}