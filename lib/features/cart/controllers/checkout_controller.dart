import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/features/cart/models/delivry_method_model.dart';
import 'package:team1_khayat/features/cart/models/payment_model.dart';
import 'package:team1_khayat/features/cart/models/shipping_address_model.dart';
import 'package:team1_khayat/features/cart/repository/checkout_repository.dart';
import 'package:team1_khayat/state_managment/app_state_controller.dart';
import 'package:team1_khayat/state_managment/app_status.dart';

class CheckoutController extends AppStateController {
// just to test
  CheckoutRepository checkoutRepository = CheckoutRepository();

  var getShippingAddressesState = AppState.idle.obs;
  var getDeliveryMethodsState = AppState.idle.obs;



  //just to display in UI
  RxList<ShippingAddressModel> shippingAddressList =
      <ShippingAddressModel>[].obs;
  Rx<int> currentShippingAddressIndex = 0.obs;





  Rx<int> currentDeliveryMethodIndex = 0.obs;

  RxList<DeliveryMethodModel> deliveryMethods = <DeliveryMethodModel>[].obs;

  void getShippingAddress() async {
    getShippingAddressesState.value = AppState.loading;
    try {
      var products = await checkoutRepository.getShippingAddresses();
      shippingAddressList.assignAll(products);
      getShippingAddressesState.value = AppState.success;
    } catch (e) {
      getShippingAddressesState.value = AppState.error;
    }
  }
  void getDeliveryMethods() async {
    getDeliveryMethodsState.value = AppState.loading;
    try {
      var result = await checkoutRepository.getDeliveryMethods();
      getDeliveryMethodsState.value = AppState.success;
      deliveryMethods.assignAll(result);

    } catch (e) {
      getDeliveryMethodsState.value = AppState.error;
    }
  }



  void changeCurrentDeliveryMethod(int index) {
    currentDeliveryMethodIndex.value = index;
  }



  // void getShippingAddress()async
  // {
  //   //just for test
  //   var products=await checkoutRepository.getShippingAddresses();
  //   //just for test
  //   shippingAddressList.assignAll(products);
  //   if(currentShippingAddressIndex.value==null)currentShippingAddressIndex=0.obs;
  // }
  //
  // void getPaymentMethods()async
  // {
  //   //just for test
  //   var paymentMethods=await checkoutRepository.getPaymentMethods();
  //   //just for test
  //   paymentList.assignAll(paymentMethods);
  //   if(currentPaymentMethodIndex.value==null)currentPaymentMethodIndex=0.obs;  }

  @override
  void onInit() {
     getShippingAddress();
    getDeliveryMethods();
    // getPaymentMethods();
    super.onInit();
  }
}
