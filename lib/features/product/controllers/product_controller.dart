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