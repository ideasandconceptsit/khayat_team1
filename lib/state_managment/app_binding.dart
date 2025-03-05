import 'package:get/get.dart';

import '../core/services/api_service.dart';
import '../core/translations/language_controller.dart';
import '../features/Catalog2/catalog_controller/filter_controller.dart';
import '../features/Catalog2/catalog_controller/product_controller.dart';
import '../features/Catalog2/catalog_controller/sort_controller.dart';
import '../features/Catalog2/repositories/category_repository.dart';
import '../features/Catalog2/repositories/fabric_repoistory.dart';
import 'app_state_controller.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<AppStateController>(AppStateController());
    Get.put<LanguageController>(LanguageController());
    Get.put(ApiService(), permanent: true);
    Get.put(CategoryRepository(), permanent: true);
    Get.put(FabricRepository(), permanent: true);
    Get.put(ProductController());
    Get.put(FilterController());
    Get.put(SortController());
  }
}
