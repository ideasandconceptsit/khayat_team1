import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/features/product/models/base_product_model.dart';
import 'package:team1_khayat/features/product/repository/product_repository.dart';
import 'package:team1_khayat/shared/app_snakbar/app_snackbar.dart';
import 'package:team1_khayat/state_managment/app_status.dart';

class ProductCardController extends GetxController {
  final BaseProductModel product;

  ProductRepository productRepository=ProductRepository();
  var addToFavoritesState = AppState.idle.obs;
  var addItemToCartState = AppState.idle.obs;

  ProductCardController({required this.product});
  var selectedImages = <String>[].obs;
  @override
  void onInit() {
    selectedImages.value = product.images!;
    super.onInit();
  }

  void updateImagesBasedOnColor(String color) {
    // هنا تحط اللوجيك اللي بيجيب الصور المناسبة للون
    if (color == 'Black') {
      selectedImages.value = [
        'assets/images/Black.jpeg',
       // 'https://example.com/red2.jpg',
      ];
    } else if (color == 'Gray') {
      selectedImages.value = [
        'assets/images/Gray.jpeg',
      ];
    }
    else if (color == 'Light_Brown') {
      selectedImages.value = [
        "assets/images/Light_Brown.jpeg",
      ];
    }else if (color == 'Petroleum ') {
      selectedImages.value = [
        "assets/images/Petroleum.jpeg"
        //'https://example.com/blue2.jpg',
      ];
    }
    else if (color == 'Brown ') {
      selectedImages.value = [
        "assets/images/Brown.jpeg",
      ];
    }
    else {
      selectedImages.value = product.images!;
    }
  }

  void addToFavorites() async {
    try {
      //todo : must change icon color according to state
      addToFavoritesState.value = AppState.loading;
      if (product is FabricProductModel) {
        await productRepository.addFabricToFavorites(product.id);
      } else {
        await productRepository.addAccessoryToFavorites(product.id);
      }
      addToFavoritesState.value = AppState.success;
      showSuccessSnackBar(AppStrings.productAddedToFavoritesSuccessfully.tr);
    } catch (e) {
      showErrorSnackBar(e.toString());
      addToFavoritesState.value = AppState.error;
    }
  }

  void addItemToCart() async {
    try {
      addItemToCartState.value = AppState.loading;
      await productRepository.addItemToCart(product.id,product is FabricProductModel?"Fabric":"Accessories");
      addItemToCartState.value = AppState.success;
      showSuccessSnackBar(AppStrings.productAddedToCartSuccessfully.tr);
    } catch (e) {
      showErrorSnackBar(e.toString());
      addItemToCartState.value = AppState.error;
    }
  }

}