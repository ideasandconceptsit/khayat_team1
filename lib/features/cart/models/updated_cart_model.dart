class UpdatedCartProductModel {
  final List<UpdatedCartItemModel> items;
  final double totalCartPrice;
  final double totalAfterDiscount;
  final String? appliedCoupon;


  UpdatedCartProductModel({
    required this.items,
    required this.totalCartPrice,
    required this.totalAfterDiscount,
    required this.appliedCoupon,
  });

  factory UpdatedCartProductModel.fromJson(Map<String, dynamic> json) {
    return UpdatedCartProductModel(
      items: (json['items'] as List)
          .map((item) => UpdatedCartItemModel.fromJson(item))
          .toList(),
      totalCartPrice: json['totalCartPrice'].toDouble(),
      totalAfterDiscount: json['totalAfterDiscount'].toDouble(),
      appliedCoupon: json['appliedCoupon'].runtimeType == String ? json['appliedCoupon'] : json['_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'items': items.map((item) => item.toJson()).toList(),
      'totalCartPrice': totalCartPrice,
      'totalAfterDiscount': totalAfterDiscount,
      'appliedCoupon': appliedCoupon,
    };
  }
}

class UpdatedCartItemModel {
  final String product;
  final String productType;
  final int quantity;
  final double price;
  final double totalPrice;

  UpdatedCartItemModel({
    required this.product,
    required this.productType,
    required this.quantity,
    required this.price,
    required this.totalPrice,
  });

  factory UpdatedCartItemModel.fromJson(Map<String, dynamic> json) {
    return UpdatedCartItemModel(
      product: json['product'],
      productType: json['productType'],
      quantity: json['quantity'],
      price: json['price'].toDouble(),
      totalPrice: json['totalPrice'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product': product,
      'productType': productType,
      'quantity': quantity,
      'price': price,
      'totalPrice': totalPrice,
    };
  }
}