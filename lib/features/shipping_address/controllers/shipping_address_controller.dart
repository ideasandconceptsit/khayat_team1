import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/features/shipping_address/models/shipping_address_model.dart';
import 'package:team1_khayat/features/shipping_address/repositers/shipping%20address_repo.dart';
import '../views/address_form.dart';
import '../views/success.dart';

class ShippingController extends GetxController {
  final ShippingAddressRepo _addressRepository = ShippingAddressRepo();
  final RxList<ShippingAddressModel> addresses = <ShippingAddressModel>[].obs;
  final RxString selectedAddressId = ''.obs;
  final Map<String, String> tempAddress = {};
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAddresses();
  }

  Future<void> fetchAddresses() async {
    try {
      isLoading.value = true;
      final fetchedAddresses = await _addressRepository.getAllAddresses();

      // Debug log to see what's coming from the server
      print('Fetched ${fetchedAddresses.length} addresses from server');

      // Create a map to deduplicate by ID
      final Map<String, ShippingAddressModel> addressMap = {};

      // Only add addresses with non-empty IDs
      for (var address in fetchedAddresses) {
        if (address.id.isNotEmpty) {
          addressMap[address.id] = address;
        } else {
          print('Warning: Address with empty ID found and skipped');
        }
      }

      // Convert map values back to list
      final uniqueAddresses = addressMap.values.toList();
      print('After deduplication: ${uniqueAddresses.length} addresses');

      // Update the observable list
      addresses.assignAll(uniqueAddresses);

      // Only set default address if none is selected
      if (selectedAddressId.isEmpty && addresses.isNotEmpty) {
        final defaultAddress = addresses.firstWhere(
          (addr) => addr.isDefault,
          orElse: () => addresses.first,
        );
        selectedAddressId.value = defaultAddress.id;
      }
    } catch (e) {
      print('Error fetching addresses: $e');
      Get.snackbar('error'.tr, 'failed_to_load_addresses'.tr,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.1),
          colorText: Colors.red);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> setDefaultAddress(String id) async {
    try {
      // Update the selected address ID
      selectedAddressId.value = id;

      // Find the selected address
      final selectedAddress = addresses.firstWhere((addr) => addr.id == id);

      // Update all addresses to set isDefault to false
      for (var address in addresses) {
        if (address.isDefault) {
          final updatedAddress = ShippingAddressModel(
            id: address.id,
            user: address.user,
            name: address.name,
            addressLine1: address.addressLine1,
            addressLine2: address.addressLine2,
            city: address.city,
            state: address.state,
            postalCode: address.postalCode,
            country: address.country,
            phone: address.phone,
            isDefault: false,
            addressType: address.addressType,
            createdAt: address.createdAt,
            updatedAt: DateTime.now(),
          );
          await _addressRepository.updateAddress(address.id, updatedAddress);
        }
      }

      // Set the selected address as default
      final updatedSelectedAddress = ShippingAddressModel(
        id: selectedAddress.id,
        user: selectedAddress.user,
        name: selectedAddress.name,
        addressLine1: selectedAddress.addressLine1,
        addressLine2: selectedAddress.addressLine2,
        city: selectedAddress.city,
        state: selectedAddress.state,
        postalCode: selectedAddress.postalCode,
        country: selectedAddress.country,
        phone: selectedAddress.phone,
        isDefault: true,
        addressType: selectedAddress.addressType,
        createdAt: selectedAddress.createdAt,
        updatedAt: DateTime.now(),
      );

      await _addressRepository.updateAddress(id, updatedSelectedAddress);

      // Refresh the addresses list
      await fetchAddresses();
    } catch (e) {
      Get.snackbar('Error', 'Failed to set default address');
    }
  }

  void editAddress(String id) {
    final address = addresses.firstWhere((addr) => addr.id == id);
    Get.to(() => AddressFormPage(addressToEdit: address))
        ?.then((_) => fetchAddresses());
  }

  void addNewAddress() {
    Get.to(() => AddressFormPage())?.then((_) => fetchAddresses());
  }

  Future<void> updateAddress(String id) async {
    final index = addresses.indexWhere((addr) => addr.id == id);
    if (index != -1) {
      final updatedAddress = ShippingAddressModel(
        id: id,
        user: addresses[index].user,
        name: tempAddress['name']!,
        addressLine1: tempAddress['addressLine1']!,
        addressLine2: tempAddress['addressLine2'] ?? '',
        city: tempAddress['city']!,
        state: tempAddress['state']!,
        postalCode: tempAddress['postalCode']!,
        country: tempAddress['country'] ?? 'Saudi Arabia'.tr,
        phone: tempAddress['phone'] ?? "01286283470",
        isDefault: addresses[index].isDefault,
        addressType: addresses[index].addressType,
        createdAt: addresses[index].createdAt,
        updatedAt: DateTime.now(),
      );

      try {
        await _addressRepository.updateAddress(id, updatedAddress);
        tempAddress.clear();
        Get.off(() => const SuccessPage())?.then((_) => fetchAddresses());
      } catch (e) {
        Get.snackbar('Error', 'Failed to update address');
      }
    }
  }

  Future<void> saveNewAddress() async {
    final newAddress = ShippingAddressModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      user: '', // يجب استبدالها بمعرف المستخدم الحقيقي
      name: tempAddress['name']!,
      addressLine1: tempAddress['addressLine1']!,
      addressLine2: tempAddress['addressLine2'] ?? '',
      city: tempAddress['city']!,
      state: tempAddress['state']!,
      postalCode: tempAddress['postalCode']!,
      country: tempAddress['country'] ?? 'Saudi Arabia'.tr,
      phone: tempAddress['phone'] ?? "",
      isDefault: addresses.isEmpty,
      addressType: 'both',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    try {
      print(
          'Attempting to save new address: ${newAddress.toJson()}'); // طباعة البيانات قبل الحفظ

      final createdAddress = await _addressRepository.createAddress(newAddress);

      print(
          'Address saved successfully: ${createdAddress.toJson()}'); // طباعة البيانات بعد الحفظ

      tempAddress.clear();
      Get.off(() => const SuccessPage())?.then((_) => fetchAddresses());

      Get.snackbar(
        'success'.tr,
        'address_saved_successfully'.tr,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(0.1),
        colorText: Colors.green,
      );
    } catch (e) {
      print('Error saving address: $e'); // طباعة الخطأ إذا حدث

      Get.snackbar(
        'error'.tr,
        'failed_to_save_address'.tr,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.1),
        colorText: Colors.red,
      );
    }
  }

  Future<void> deleteAddress(String id) async {
    try {
      // Store the address being deleted in case we need to restore it
      final deletedAddress = addresses.firstWhere((addr) => addr.id == id);

      // First remove from local list to update UI immediately
      addresses.removeWhere((addr) => addr.id == id);

      // Handle the case where the deleted address was the selected one
      if (selectedAddressId.value == id) {
        if (addresses.isNotEmpty) {
          // If there are other addresses, select one of them
          final newDefaultAddress = addresses.firstWhere(
            (addr) => addr.isDefault,
            orElse: () => addresses.first,
          );
          selectedAddressId.value = newDefaultAddress.id;
        } else {
          // If no addresses left, clear the selected ID
          selectedAddressId.value = '';
        }
      }

      // Then delete from repository with proper error handling
      try {
        await _addressRepository.deleteAddress(id);

        // Show localized success message
        Get.snackbar(
          'success'.tr,
          'address_deleted_successfully'.tr,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.withOpacity(0.1),
          colorText: Colors.green,
          duration: const Duration(seconds: 2),
          margin: EdgeInsets.all(10),
          borderRadius: 8,
          icon: Icon(Icons.check_circle, color: Colors.green),
        );
      } catch (repoError) {
        // Restore the address since deletion failed
        addresses.add(deletedAddress);

        // Show localized error message
        Get.snackbar(
          'error'.tr,
          'failed_to_delete_address'.tr,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.1),
          colorText: Colors.red,
          duration: const Duration(seconds: 3),
          margin: EdgeInsets.all(10),
          borderRadius: 8,
          icon: Icon(Icons.error_outline, color: Colors.red),
          mainButton: TextButton(
            onPressed: () => deleteAddress(id),
            child: Text('retry'.tr, style: TextStyle(color: Colors.white)),
          ),
        );
      }
    } catch (e) {
      // This is for any unexpected errors in the controller logic
      Get.snackbar(
        'error'.tr,
        'unexpected_error_occurred'.tr,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.1),
        colorText: Colors.red,
        duration: const Duration(seconds: 3),
        margin: EdgeInsets.all(10),
        borderRadius: 8,
        icon: Icon(Icons.error_outline, color: Colors.red),
      );

      // Refresh the list to ensure UI is in sync with backend
      fetchAddresses();
    }
  }
}
