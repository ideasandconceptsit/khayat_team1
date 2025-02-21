import 'package:get/get.dart';
import 'package:team1_khayat/features/shipping_address/models/shipping_address_model.dart';

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

  void setDefaultAddress(String id) {
    selectedAddressId.value = id;
    addresses.refresh();
  }

  void editAddress(String id) {}

  void addNewAddress() {}
}
