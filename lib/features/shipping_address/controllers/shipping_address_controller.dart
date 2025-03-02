import 'package:get/get.dart';
import 'package:team1_khayat/features/shipping_address/models/shipping_address_model.dart';

import '../views/address_form.dart';
import '../views/success.dart';

class ShippingController extends GetxController {
  final RxList<ShippingAddressModel> addresses = <ShippingAddressModel>[
    ShippingAddressModel(
      id: '1',
      name: 'Jane Doe',
      street: '3 Newbridge Court',
      city: 'Chino Hills',
      state: 'CA',
      zipCode: '91709',
      country: 'United States',
      isDefault: true,
    ),
    ShippingAddressModel(
      id: '2',
      name: 'John Doe',
      street: '3 Newbridge Court',
      city: 'Chino Hills',
      state: 'CA',
      zipCode: '91709',
      country: 'United States',
    ),
    ShippingAddressModel(
      id: '3',
      name: 'John Doe',
      street: '51 Riverside',
      city: 'Chino Hills',
      state: 'CA',
      zipCode: '91709',
      country: 'United States',
    ),
  ].obs;

  final RxString selectedAddressId = '1'.obs;
  final Map<String, String> tempAddress = {};

  void setDefaultAddress(String id) {
    selectedAddressId.value = id;
    addresses.refresh();
  }

  void editAddress(String id) {
    final address = addresses.firstWhere((addr) => addr.id == id);
    Get.to(() => AddressFormPage(addressToEdit: address));
  }

  void addNewAddress() {
    Get.to(() => AddressFormPage());
  }

  void updateAddress(String id) {
    final index = addresses.indexWhere((addr) => addr.id == id);
    if (index != -1) {
      addresses[index] = ShippingAddressModel(
        id: id,
        name: tempAddress['name']!,
        street: tempAddress['street']!,
        city: tempAddress['city']!,
        state: tempAddress['state']!,
        zipCode: tempAddress['zipCode']!,
        country: tempAddress['country'] ?? 'United States',
        isDefault: addresses[index].isDefault,
      );
      addresses.refresh();
      tempAddress.clear();
      Get.off(() => const SuccessPage());
    }
  }

  void saveNewAddress() {
    final newId = (addresses.length + 1).toString();
    addresses.add(ShippingAddressModel(
      id: newId,
      name: tempAddress['name']!,
      street: tempAddress['street']!,
      city: tempAddress['city']!,
      state: tempAddress['state']!,
      zipCode: tempAddress['zipCode']!,
      country: tempAddress['country'] ?? 'United States',
    ));
    tempAddress.clear();
    Get.off(() => const SuccessPage());
  }
}
