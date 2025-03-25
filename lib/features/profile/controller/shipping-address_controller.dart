import 'dart:developer';
import 'package:get/get.dart';
import 'package:team1_khayat/features/profile/model/address_model.dart';
import 'package:team1_khayat/features/profile/repos/shipping_address_repos.dart';
import 'package:team1_khayat/shared/app_snakbar/app_snackbar.dart';

class ShippingAddressController extends GetxController {
  final ShippingAddressRepository _addressRepository;

  ShippingAddressController(this._addressRepository);

  var addresses = <AddressModel>[].obs;
  var selectedAddressId = ''.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAllAddresses();
  }

  Future<void> fetchAllAddresses() async {
    try {
      isLoading.value = true;
      final allAddresses = await _addressRepository.fetchAllAddresses();
      if (allAddresses != null && allAddresses.isNotEmpty) {
        addresses.assignAll(allAddresses);
        selectedAddressId.value = addresses.first.id; // تحديد أول عنوان افتراضيًا
        log("✅ تم تحميل ${addresses.length} عنوان بنجاح.");
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

  // Future<void> editAddress(AddressModel updatedAddress) async {
  //   try {
  //     await _addressRepository.updateAddress(updatedAddress);
  //     int index = addresses.indexWhere((addr) => addr.id == updatedAddress.id);
  //     if (index != -1) {
  //       addresses[index] = updatedAddress;
  //       addresses.refresh();
  //     }
  //     SnackbarHelper.showSuccessSnackbar("تم تحديث العنوان بنجاح.");
  //   } catch (e) {
  //     log("❌ خطأ أثناء تعديل العنوان: $e");
  //     SnackbarHelper.showErrorSnackbar("تعذر تحديث العنوان.");
  //   }
  // }

  /// حذف عنوان معين
  // Future<void> deleteAddress(String addressId) async {
  //   try {
  //     await _addressRepository.deleteAddress(addressId);
  //     addresses.removeWhere((address) => address.id == addressId);

  //     if (selectedAddressId.value == addressId && addresses.isNotEmpty) {
  //       selectedAddressId.value = addresses.first.id;
  //     }
  //     SnackbarHelper.showSuccessSnackbar("تم حذف العنوان بنجاح.");
  //   } catch (e) {
  //     log("❌ خطأ أثناء حذف العنوان: $e");
  //     SnackbarHelper.showErrorSnackbar("تعذر حذف العنوان.");
  //   }
  // }

  /// إضافة عنوان جديد
  // Future<void> addNewAddress(AddressModel newAddress) async {
  //   try {
  //     final addedAddress = await _addressRepository.addAddress(newAddress);
  //     addresses.add(addedAddress);
  //     SnackbarHelper.showSuccessSnackbar("تمت إضافة العنوان بنجاح.");
  //   } catch (e) {
  //     log("❌ خطأ أثناء إضافة العنوان: $e");
  //     SnackbarHelper.showErrorSnackbar("تعذر إضافة العنوان.");
  //   }
  // }
}
