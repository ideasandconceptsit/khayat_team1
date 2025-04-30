import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
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
  final secureStorage = const FlutterSecureStorage();

  Rx<String> cardNumber = "".obs;

  var getPaymentCardsState = AppState.idle.obs;
  var createPaymentMethodState = AppState.idle.obs;

  Rx<int> currentPaymentMethodIndex = (-1).obs;
  PaymentRepository paymentRepository = PaymentRepository();

  RxList<PaymentCardModel> paymentCardsList = <PaymentCardModel>[].obs;

  void getPaymentCards() async {
    getPaymentCardsState.value = AppState.loading;
    try {
      var result = await paymentRepository.getPaymentCards();
      getPaymentCardsState.value = AppState.success;
      paymentCardsList.assignAll(result);
      await _savePaymentAndChangeIndex();
    } catch (e) {
      getPaymentCardsState.value = AppState.error;
    }
  }

  Future<void> _savePaymentAndChangeIndex() async {
    String? savedPayment=await secureStorage.read(key: 'currentPaymentMethodId');
    changeDefaultPaymentMethod(paymentCardsList.indexWhere(
      (element) => element.id == savedPayment),);
    if(currentPaymentMethodIndex.value==-1&&paymentCardsList.isNotEmpty)
      {
        changeDefaultPaymentMethod(0);
      }
  }

  void changeDefaultPaymentMethod(int index) async {
    currentPaymentMethodIndex.value = index;
    await secureStorage.write(
        key: 'currentPaymentMethodId',
        value: paymentCardsList[currentPaymentMethodIndex.value].id);
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
      if (isAddPaymentMethodSetDefaultEnabled.value||paymentCardsList.length==1) {
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

  Rx<String> get hiddenCardNumber =>
      "**** **** **** ${paymentCardsList[currentPaymentMethodIndex.value].cardNumber.substring(12, paymentCardsList[currentPaymentMethodIndex.value].cardNumber.length)}"
          .obs;

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
