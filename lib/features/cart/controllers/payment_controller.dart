import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/features/cart/models/add_card_model.dart';
import 'package:team1_khayat/features/cart/models/payment_card_model.dart';
import 'package:team1_khayat/features/cart/repository/payment_repository.dart';
import 'package:team1_khayat/shared/app_snakbar/app_snackbar.dart';
import 'package:team1_khayat/state_managment/app_status.dart';

class PaymentController extends GetxController {
  TextEditingController nameOnCardController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expireDateController = TextEditingController();
  TextEditingController cVVDateController = TextEditingController();

  Rx<String> cardNumber = "".obs;

  var getPaymentCardsState = AppState.idle.obs;
  var createPaymentMethodState = AppState.idle.obs;

  Rx<int> currentPaymentMethodIndex = 0.obs;
  PaymentRepository paymentRepository = PaymentRepository();

  RxList<PaymentCardModel> paymentCardsList = <PaymentCardModel>[].obs;

  void getPaymentCards() async {
    getPaymentCardsState.value = AppState.loading;
    try {
      var result = await paymentRepository.getPaymentCards();
      getPaymentCardsState.value = AppState.success;
      paymentCardsList.assignAll(result);
    } catch (e) {
      getPaymentCardsState.value = AppState.error;
    }
  }

  void changeDefaultPaymentMethod(int index) {
    currentPaymentMethodIndex.value = index;
  }

  void addPaymentMethod() async {
    createPaymentMethodState.value = AppState.loading;
    try {
      AddCardModel addCardModel = AddCardModel(
          cardNumber: cardNumberController.text,
          holderName: nameOnCardController.text,
          expiryDate: expireDateController.text,
          cvv: cVVDateController.text);
      PaymentCardModel card =
          await paymentRepository.addPaymentCard(addCardModel);
      paymentCardsList.add(card);
      if(isAddPaymentMethodSetDefaultEnabled.value){
        changeDefaultPaymentMethod(paymentCardsList.length - 1);
      }
      Get.back();
      showSuccessSnackBar(AppStrings.paymentCardAddedSuccessfully.tr);
      resetControllers();
      createPaymentMethodState.value = AppState.success;
    } catch (e) {
      showErrorSnackBar(e.toString());
      createPaymentMethodState.value = AppState.error;
    }
  }

  void resetControllers() {
    nameOnCardController.clear();
    cardNumberController.clear();
    expireDateController.clear();
    cVVDateController.clear();
  }

  Rx<bool> isAddPaymentMethodSetDefaultEnabled = false.obs;

  void changeIsAddPaymentMethodSetDefaultEnabled() =>
      isAddPaymentMethodSetDefaultEnabled.value =
          !isAddPaymentMethodSetDefaultEnabled.value;

  @override
  void onInit() {
    cardNumberController
        .addListener(() => cardNumber.value = cardNumberController.text);
    getPaymentCards();
    super.onInit();
  }
}
