import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/features/cart/models/cart_product_model.dart';
import 'package:team1_khayat/features/cart/models/promo_code_model.dart';
import 'package:team1_khayat/features/cart/models/updated_cart_model.dart';
import 'package:team1_khayat/features/cart/repository/cart_repository.dart';
import 'package:team1_khayat/shared/app_snakbar/app_snackbar.dart';
import 'package:team1_khayat/state_managment/app_state_controller.dart';
import 'package:team1_khayat/state_managment/app_status.dart';


class CartController extends AppStateController {
  var promoCodeState = AppState.idle.obs;
  var applyCouponState = AppState.idle.obs;
  var getCartProductsState = AppState.idle.obs;
  var getCartProductsErrorMessage = "".obs;
  var addToFavoritesState = AppState.idle.obs;
  var removeFromFavoritesState = AppState.idle.obs;
  var deleteProductFromCartState = AppState.idle.obs;
  var updateCartItemQuantityState = AppState.idle.obs;
  var clearPromoCodeState = AppState.idle.obs;

  // just to test
  CartRepository cartRepository = CartRepository();

  late TextEditingController promoCodeController;
  var promoCodeText = "".obs;

  //just to display in UI
  final cartProductModel = Rx<CartProductModel?>(null);

  //just to display in UI
  RxList<PromoCodeModel> promCodeList = <PromoCodeModel>[].obs;

  final Map<String, Timer> _timers = {};

  void getCartProducts() async {
    try {
      getCartProductsState.value = AppState.loading;
      var cartProduct = await cartRepository.getCartProducts();
      cartProductModel.value = cartProduct;
      fillItemsAndQuantity();
      getCartProductsState.value = AppState.success;
    } catch (e) {
      getCartProductsErrorMessage.value = e.toString();
      getCartProductsState.value = AppState.error;
    }
  }

  void fillItemsAndQuantity()
  {
    cartProductModel.value?.items.forEach((element) {
      itemsAndQuantity[element.product.id]=element.quantity.value;
    },);
  }

  void getPromoCodes() async {
    try {
      promoCodeState.value = AppState.loading;
      var promoCodes = await cartRepository.getPromoCodes();
      promCodeList.assignAll(promoCodes);
      promoCodeState.value = AppState.success;
    } catch (e) {
      promoCodeState.value = AppState.error;
    }
  }

  void applyCoupon(String couponCode, String couponId) async {
    String? oldCouponId = cartProductModel.value?.appliedCoupon.value?.id;

    try {
      applyCouponState.value = AppState.loading;
      cartProductModel.value?.appliedCoupon.value =
          AppliedCouponModel(id: couponId);
      UpdatedCartProductModel result =
          await cartRepository.applyCoupon(couponCode);
      _updateCartPrices(result);
      _updateCartCoupon(result);

      applyCouponState.value = AppState.success;
      Get.back();
      showSuccessSnackBar(AppStrings.couponAppliedSuccessfully.tr);
    } catch (e) {
      showErrorSnackBar(e.toString());
      cartProductModel.value?.appliedCoupon.value = cartProductModel
          .value?.appliedCoupon.value
          ?.copyWith(id: oldCouponId);
      applyCouponState.value = AppState.error;
    }
  }

  void addToFavorites(String cartItemId, String type) async {
    try {
      addToFavoritesState.value = AppState.loading;
      if (type == "Fabric") {
        await cartRepository.addFabricToFavorites(cartItemId);
      } else {
        await cartRepository.addAccessoryToFavorites(cartItemId);
      }
      addToFavoritesState.value = AppState.success;
      showSuccessSnackBar(AppStrings.productAddedToFavoritesSuccessfully.tr);
    } catch (e) {
      showErrorSnackBar(e.toString());
      addToFavoritesState.value = AppState.error;
    }
  }
  void removeFromFavorites(String cartItemId, String type) async {
    try {
      removeFromFavoritesState.value = AppState.loading;
      if (type == "Fabric") {
        await cartRepository.removeFabricFromFavorites(cartItemId);
      } else {
        await cartRepository.removeFabricFromFavorites(cartItemId);
      }
      removeFromFavoritesState.value = AppState.success;
      showSuccessSnackBar(AppStrings.productRemovedFromCartSuccessfully.tr);
    } catch (e) {
      showErrorSnackBar(e.toString());
      removeFromFavoritesState.value = AppState.error;
    }
  }

  void deleteProductFromCart(String cartItemId) async {
    deleteProductFromCartState.value = AppState.loading;
    var oldProductModel = cartProductModel.value;
    try {
      cartProductModel.value?.items
          .removeWhere((element) => element.product.id == cartItemId);
      var result = await cartRepository.removeItemFromCart(cartItemId);
      _updateCartPrices(result);
      deleteProductFromCartState.value = AppState.success;
      itemsAndQuantity.remove(cartItemId);
      showSuccessSnackBar(AppStrings.productRemovedFromCartSuccessfully.tr);
    } catch (e) {
      cartProductModel.value = oldProductModel;
      fillItemsAndQuantity();
      deleteProductFromCartState.value = AppState.error;
      showErrorSnackBar(e.toString());
    }
  }

  void _updateCartPrices(UpdatedCartProductModel result) {
    cartProductModel.value?.totalCartPrice.value = result.totalCartPrice;
    cartProductModel.value?.totalAfterDiscount.value =
        result.totalAfterDiscount;
    log(cartProductModel.value!.totalAfterDiscount.value.toString());
  }

  void _updateCartCoupon(UpdatedCartProductModel result) {
    cartProductModel.value?.appliedCoupon.value =
        AppliedCouponModel(id: result.appliedCoupon);
  }

  Map<String,int> itemsAndQuantity={};
  void updateCartItemQuantity(String cartItemId, int updatedQuantity) async {
    if (updatedQuantity <= 0) return;
    updateCartItemQuantityState.value = AppState.loading;
    cartProductModel.value?.items
        .where((element) => element.product.id == cartItemId)
        .single
        .quantity
        .value = updatedQuantity;

    _timers[cartItemId]?.cancel();
    _timers[cartItemId] = Timer(const Duration(seconds: 3), ()async {
      try {
        UpdatedCartProductModel result =
            await cartRepository.updateCartProduct(cartItemId, updatedQuantity);
        _updateCartPrices(result);
        itemsAndQuantity[cartItemId]=result.items.where((element) => element.product==cartItemId,).first.quantity;
        updateCartItemQuantityState.value = AppState.success;
      } catch (e) {
        cartProductModel.value?.items
            .where((element) => element.product.id == cartItemId)
            .single
            .quantity
            .value = itemsAndQuantity[cartItemId]!;

        updateCartItemQuantityState.value = AppState.error;
        showErrorSnackBar(e.toString());
      }
    });
  }

  void clearPromoCode() => promoCodeController.clear();


  // This getter calculates the total price of all items in the cart by folding through the cartProducts list.
  // It multiplies each product's price by its quantity and sums up the values to return the total price.
  // Zero is the initial value.
  // double get getProductsTotalPrice => cartProducts.fold(
  //     0, (previousTotalPrice, product) => previousTotalPrice + product.price*product.quantity.value);

  @override
  void onInit() {
    promoCodeController = TextEditingController()
      ..addListener(
        () {
          promoCodeText.value = promoCodeController.text;
        },
      );
    getCartProducts();
    getPromoCodes();
    super.onInit();
  }

  @override
  void onClose() {
    promoCodeController.dispose();
    super.onClose();
  }
}
