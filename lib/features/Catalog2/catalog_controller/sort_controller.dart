import 'package:get/get.dart';

class SortController extends GetxController {
  final RxString currentSort = 'popular'.obs;

  void changeSort(String value) {
    currentSort.value = value;
  }

  String get sortText {
    switch (currentSort.value) {
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
