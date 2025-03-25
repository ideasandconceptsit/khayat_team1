import 'package:get/get.dart';

import 'product_controller.dart';

class SortController extends GetxController {
  final ProductController productController = Get.find<ProductController>();

  String get currentSort => productController.currentSort.value;

  void changeSort(String value) {
    productController.changeSort(value);
  }

  String get sortText {
    switch (productController.currentSort.value) {
      case 'popular':
        return 'popular'.tr;
      case 'newest':
        return 'newest'.tr;
      case 'customer_review':
        return 'customer review'.tr;
      case 'price_low':
        return 'price lowest to high'.tr;
      case 'price_high':
        return 'price highest to low'.tr;
      default:
        return 'popular'.tr;
    }
  }
}
