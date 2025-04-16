import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/features/profile/model/add_address_model.dart';
import 'package:team1_khayat/features/profile/model/address_model.dart';
import 'package:team1_khayat/features/profile/repos/shipping_address_repos.dart';
import 'package:team1_khayat/shared/app_snakbar/app_snackbar.dart';


class ShippingAddressController extends GetxController {
  final ShippingAddressRepository _addressRepository;
  ShippingAddressController(this._addressRepository);

  var addreesses = <AddressModel>[].obs;
  var isLoading = false.obs;
  var selectedAddressId = "".obs;
   final fullNameController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final zipCodeController = TextEditingController();
  final phoneController = TextEditingController();
  final addressTypeController = TextEditingController();
  final countryController = TextEditingController();
  RxList<AddAddressModel> addresses = <AddAddressModel>[].obs;


  @override
  void onInit() {
    fetchAllAddresses();
    super.onInit();
  }

  /// جلب جميع العناوين
    Future<void> fetchAllAddresses() async {
    try {
      isLoading.value = true;
      final allAddresses = await _addressRepository.fetchAllAddresses();
      if (allAddresses != null && allAddresses.isNotEmpty) {
        addreesses.assignAll(allAddresses);
        selectedAddressId.value = addreesses.first.id; // تحديد أول عنوان افتراضيًا
        log("✅ تم تحميل ${addreesses.length} عنوان بنجاح.");
      } else {
        log("❌ لا يوجد أي عناوين متاحة.");
        SnackbarHelper.showErrorSnackbar("لم يتم العثور على أي عناوين.");
      }
    } catch (e) {
      log("❌ خطأ أثناء تحميل العناوين: $e");
      SnackbarHelper.showErrorSnackbar("حدث خطأ أثناء تحميل العناوين.");
    } finally {
      isLoading.value = false;
    }
  }

  void setDefaultAddress(String addressId) {
    selectedAddressId.value = addressId;
  }

  /// إضافة عنوان جديد
    Future<void> addNewAddress() async {
    try {
      final newAddress = AddAddressModel(
        name: fullNameController.text,
        addressLine1: addressController.text,
        addressLine2: "",
        city: cityController.text,
        state: stateController.text,
        postalCode: zipCodeController.text,
        country: countryController.text,
        phone: phoneController.text,
        addressType: addressTypeController.text,
      );

      // محاكاة الإضافة إلى قاعدة البيانات
      await Future.delayed(Duration(seconds: 1)); // يمكنك استبدالها بـ API call
      addresses.add(newAddress);

      // إظهار رسالة النجاح
      Get.snackbar("نجاح", "تمت إضافة العنوان بنجاح",
          backgroundColor: Colors.green, colorText: Colors.white);
    } catch (e) {
      // إظهار رسالة الخطأ
      Get.snackbar("خطأ", "حدث خطأ أثناء إضافة العنوان",
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  /// حذف عنوان
  Future<void> deleteAddress(String addressId) async {
    try {
      isLoading.value = true;
      final success = await _addressRepository.deleteAddress(addressId);

      if (success) {
        log("✅ العنوان تم حذفه بنجاح");
        addreesses.removeWhere((address) => address.id == addressId);
        SnackbarHelper.showSuccessSnackbar("تم حذف العنوان بنجاح.");
      } else {
        log("❌ فشل في حذف العنوان");
        SnackbarHelper.showErrorSnackbar("حدث خطأ أثناء حذف العنوان.");
      }
    } catch (e) {
      log("❌ خطأ أثناء حذف العنوان: $e");
      SnackbarHelper.showErrorSnackbar("حدث خطأ أثناء حذف العنوان.");
    } finally {
      isLoading.value = false;
    }
  }
}
