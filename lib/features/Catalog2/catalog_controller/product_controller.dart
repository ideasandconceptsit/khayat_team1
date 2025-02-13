import 'package:get/get.dart';

import '../../../models/product.dart';

class ProductController extends GetxController {
  final RxList<Product> products = <Product>[].obs;
  final RxSet<int> likedProducts = <int>{}.obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize with some products
    products.addAll([
      const Product(
        id: 1,
        image: "https://m.media-amazon.com/images/I/612OCczgZHL._AC_SX679_.jpg",
        brand: "Mango",
        name: "T-Shirt SPANISH",
        price: 9,
        rating: 4,
        reviews: 3,
      ),
      const Product(
        id: 2,
        image: "https://m.media-amazon.com/images/I/51HTJqSUlEL._AC_SX679_.jpg",
        brand: "Dorothy Perkins",
        name: "Blouse",
        price: 14,
        originalPrice: 21,
        rating: 5,
        reviews: 10,
        discount: 20,
      ),
      const Product(
        id: 3,
        image: "https://m.media-amazon.com/images/I/51HTJqSUlEL._AC_SX679_.jpg",
        brand: "LA la",
        name: "Blouse",
        price: 22,
        originalPrice: 10,
        rating: 1,
        reviews: 10,
        discount: 60,
      ),
      const Product(
        id: 5,
        image: "https://m.media-amazon.com/images/I/51HTJqSUlEL._AC_SX679_.jpg",
        brand: "Dorothy Perkins",
        name: "Blouse",
        price: 14,
        originalPrice: 21,
        rating: 0,
        reviews: 10,
        discount: 20,
      ),
    ]);
  }

  void toggleLike(int productId) {
    if (likedProducts.contains(productId)) {
      likedProducts.remove(productId);
    } else {
      likedProducts.add(productId);
    }
  }

  bool isLiked(int productId) {
    return likedProducts.contains(productId);
  }
}
