import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  var selectedProductColor="".obs;
  var selectedProductSize="".obs;
  late PageController pageController;



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

  void changeProductSizeOrColor({ String? size, String? color}) {

    if(size!=null) {
      selectedProductSize.value=size;
    }
    if(color!=null) {
      selectedProductColor.value=color;
    }
  }

  void changePageViewIndex(int index){
    pageController.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  @override
  void onInit() {
    selectedProductColor.value=product.colors?.first??"";
    selectedProductSize.value=product.sizes?.first??"";
    if(product.colors?.isNotEmpty ?? false){
      pageController=PageController(initialPage: product.colors!.indexOf(selectedProductColor.value));
    }
    else{
      pageController=PageController();
    }
    super.onInit();
  }

}