import 'package:team1_khayat/features/cart/models/cart_product_model.dart';
import 'package:team1_khayat/features/cart/models/promo_code_model.dart';

class CartRepository {
  Future<List<CartProductModel>> getCartProducts()async {
    //just for test
    return [
      for (int i = 0; i < 10; i++)
        CartProductModel(
            quantity: 1,
            color: 'Blue',
            title: "Product Name ${i+1}",
            id: i.toString(),
            size: "L",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXe6CTm6ZSvBLe5hoD6B3JZPFu_JlVPvYfx7_Qo83OBl2POjtDHjHaoyQ&s",
            price: 10)
    ];
  }
  Future<List<PromoCodeModel>> getPromoCodes()async {
    //just for test
    return [
      for(int i=0;i<10;i++)
        PromoCodeModel(
          id: i.toString(),
          title: "${(i+1)*10}% Discount",
          code: "${i}123132",
          imageUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR02azObG6Ea0DOVpyzX5WwvGYKh9PXIit9jw&s",
          validityDays: 20,
        )
    ];
  }
}
