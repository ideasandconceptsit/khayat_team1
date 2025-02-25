import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/features/cart/models/cart_product_model.dart';
import 'package:team1_khayat/features/cart/models/promo_code_model.dart';
import 'package:team1_khayat/features/cart/repository/cart_repository.dart';
import 'package:team1_khayat/state_managment/app_state_controller.dart';

class CartController extends AppStateController {

  // just to test
  CartRepository cartRepository=CartRepository();

  late TextEditingController  promoCodeController;
  var promoCodeText="".obs;

  //just to display in UI
  RxList<CartProductModel> cartProducts = <CartProductModel>[].obs;


  //just to display in UI
  RxList<PromoCodeModel> promCodeList =<PromoCodeModel>[].obs;


  void getCartProducts()async
  {
    //just for test
    var products=await cartRepository.getCartProducts();
    cartProducts.assignAll(products);
  }
  void getPromoCodes()async
  {
    //just for test
    var promoCodes=await cartRepository.getPromoCodes();
    promCodeList.assignAll(promoCodes);
  }


  void addToFavorites(CartProductModel cartProductModel) {
    // implement addToFavorites logic
  }

  void deleteProductFromCart(CartProductModel cartProductModel) {
    cartProducts.removeWhere((product) => cartProductModel.id==product.id,);
    // implement deleteProductFromCart logic
  }

  void increaseQuantity(CartProductModel cartProductModel) {

     cartProductModel.quantity.value++;

    // increaseQuantity implementation.
  }

   void decreaseQuantity(CartProductModel cartProductModel) {
    if(cartProductModel.quantity.value>1) {
      cartProductModel.quantity.value--;
    }
     // decreaseQuantity implementation.
   }

  void clearPromoCode() => promoCodeController.clear();

  void selectPromoCode(String promoCode) => promoCodeController.text=promoCode;


  // This getter calculates the total price of all items in the cart by folding through the cartProducts list.
  // It multiplies each product's price by its quantity and sums up the values to return the total price.
  // Zero is the initial value.
  double get getProductsTotalPrice => cartProducts.fold(
      0, (previousTotalPrice, product) => previousTotalPrice + product.price*product.quantity.value);


  @override
  void onInit() {
    promoCodeController=TextEditingController()..addListener(() {
      promoCodeText.value=promoCodeController.text;
    },);
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
