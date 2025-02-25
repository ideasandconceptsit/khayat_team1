import 'package:team1_khayat/features/cart/models/payment_model.dart';
import 'package:team1_khayat/features/cart/models/shipping_address_model.dart';

class CheckoutRepository{
  Future<List<ShippingAddressModel>> getShippingAddresses()async {
    //just for test
    return [
      for (int i = 0; i < 10; i++)
        ShippingAddressModel(
            id: i.toString(),
            fullName: "Name ${i + 1}",
            address: "Address ${i + 1}",
            city: "City ${i + 1}",
            state: "State ${i + 1}",
            zipCode: "ZipCode ${i + 1}",
            country: "Country ${i + 1}")
    ];
  }
  Future<List<PaymentModel>> getPaymentMethods()async {
    //just for test
    return [
      for (int i = 0; i < 5; i++)
        PaymentModel(
            id: i.toString(),
            nameOnCard: "Name ${i + 1}",
            cardNumber: "5546 8205 3693 39$i",
            expireDate: "05/23",
            cVV: "56$i",
        )
    ];
  }
}