import 'package:get/get.dart';

class CartProductModel {
  RxList<CartItemModel> items;
  final RxDouble totalCartPrice;
  final RxDouble totalAfterDiscount;
  final Rx<AppliedCouponModel?> appliedCoupon;

  CartProductModel({
    required this.items,
    required double totalCartPrice,
    required double totalAfterDiscount,
    AppliedCouponModel? appliedCoupon,
  })  : totalCartPrice = totalCartPrice.obs,
        totalAfterDiscount = totalAfterDiscount.obs,
        appliedCoupon = appliedCoupon?.obs ?? Rx<AppliedCouponModel?>(null);

  factory CartProductModel.fromJson(Map<String, dynamic> json) {
    return CartProductModel(
      items: ((json['items'] as List).map((item) {
        return CartItemModel.fromJson(item);
      }).toList()).obs,
      totalCartPrice: json['totalCartPrice'].toDouble(),
      totalAfterDiscount: json['totalAfterDiscount'].toDouble(),
      appliedCoupon: json['appliedCoupon'] != null
          ? AppliedCouponModel.fromJson(json['appliedCoupon'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'items': items.value.map((item) => item.toJson()).toList(),
      'totalCartPrice': totalCartPrice.value,
      'totalAfterDiscount': totalAfterDiscount.value,
      'appliedCoupon': appliedCoupon.value?.toJson(),
    };
  }
}

class CartItemModel {
  final ProductModel product;
  final String productType;
  final String? color;
  final String? size;
  final Rx<int> quantity;
  final double price;
  final Rx<double> totalPrice;

  CartItemModel({
    required this.product,
    required this.productType,
    required this.color,
    required this.size,
    required int quantity,
    required this.price,
    required double totalPrice,
  })  : quantity = quantity.obs,
        totalPrice = totalPrice.obs;

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      product: ProductModel.fromJson(json['product']),
      productType: json['productType'],
      size: json['size'],
      color: json['color'],
      quantity: json['quantity'],
      price: json['price'].toDouble(),
      totalPrice: json['totalPrice'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product': product.toJson(),
      'productType': productType,
      'quantity': quantity.value,
      'price': price,
      'totalPrice': totalPrice.value,
      'color': color,
      'size': size,
    };
  }
}

class ProductModel {
  final String id;
  final String name;
  final CategoryModel category;
  final double pricePerMeter;

  ProductModel({
    required this.id,
    required this.name,
    required this.category,
    required this.pricePerMeter,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['_id'],
      name: json['name'],
      category: CategoryModel.fromJson(json['category']),
      pricePerMeter: json['pricePerMeter'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'category': category.toJson(),
      'pricePerMeter': pricePerMeter,
    };
  }
}

class CategoryModel {
  final String id;
  final String name;

  CategoryModel({
    required this.id,
    required this.name,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['_id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
    };
  }
}

class AppliedCouponModel {
  final String? id;
  final String? name;
  final double? discount;
  final String? expiresAt;

  AppliedCouponModel({
     this.id,
     this.name,
     this.discount,
     this.expiresAt,
  });

  factory AppliedCouponModel.fromJson(Map<String, dynamic> json) {
    return AppliedCouponModel(
      id: json['_id'],
      name: json['name'],
      discount: json['discount'].toDouble(),
      expiresAt: json['expiresAt'],
    );
  }

  //copy with
  AppliedCouponModel copyWith({
    String? id,
    String? name,
    double? discount,
    String? expiresAt,
  }) {
    return AppliedCouponModel(
      id: id ?? this.id,
      name: name ?? this.name,
      discount: discount ?? this.discount,
      expiresAt: expiresAt ?? this.expiresAt,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'discount': discount,
      'expiresAt': expiresAt,
    };
  }
}

