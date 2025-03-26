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

  TextEditingController nameOnCardController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  Rx<String> cardNumber = "".obs;
  TextEditingController expireDateController = TextEditingController();
  TextEditingController cVVDateController = TextEditingController();

  //just to display in UI
  RxList<ShippingAddressModel> shippingAddressList =
      <ShippingAddressModel>[].obs;
  Rx<int> currentShippingAddressIndex = 0.obs;

  RxList<PaymentModel> paymentList = <PaymentModel>[
    for (int i = 0; i < 5; i++)
      PaymentModel(
        id: i.toString(),
        nameOnCard: "Name ${i + 1}",
        cardNumber: i % 2 == 0 ? "411111111111111$i" : "510510510510510$i",
        expireDate: "05/23",
        cVV: "56$i",
      )
  ].obs;

  Rx<int> currentPaymentMethodIndex = 0.obs;

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

  void changeDefaultPaymentMethod(int index) {
    currentPaymentMethodIndex.value = index;
  }

  void changeCurrentDeliveryMethod(int index) {
    currentDeliveryMethodIndex.value = index;
  }

  void addPaymentMethod() {
    paymentList.add(PaymentModel(
      nameOnCard: nameOnCardController.text,
      cardNumber: cardNumber.value,
      expireDate: expireDateController.text,
      cVV: cVVDateController.text,
      id: '',
    ));
    nameOnCardController.clear();
    cardNumberController.clear();
    expireDateController.clear();
    cVVDateController.clear();
    if (isAddPaymentMethodSetDefaultEnabled.value)
      currentPaymentMethodIndex.value = paymentList.length - 1;
  }

  Rx<bool> isAddPaymentMethodSetDefaultEnabled = false.obs;

  void changeIsAddPaymentMethodSetDefaultEnabled() =>
      isAddPaymentMethodSetDefaultEnabled.value =
          !isAddPaymentMethodSetDefaultEnabled.value;

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
    cardNumberController
        .addListener(() => cardNumber.value = cardNumberController.text);
     getShippingAddress();
    getDeliveryMethods();
    // getPaymentMethods();
    super.onInit();
  }
}
