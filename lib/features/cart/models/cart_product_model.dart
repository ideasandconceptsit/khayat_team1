import 'package:get/get.dart';

class CartProductModel {
  final String id;
  final String title;
  final String color;
  final String imageUrl;
  final RxInt quantity;
  final RxDouble price;
  final String size;

  CartProductModel({
    required this.id,
    required this.title,
    required this.color,
    required this.imageUrl,
    required int quantity,
    required double price,
    required this.size,
  })  : quantity = quantity.obs,
        price = price.obs;

  factory CartProductModel.fromJson(Map<String, dynamic> json) {
    return CartProductModel(
      id: json['id'],
      title: json['title'],
      color: json['color'],
      imageUrl: json['imageUrl'],
      quantity: json['quantity'],
      price: json['price'],
      size: json['size'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'color': color,
      'imageUrl': imageUrl,
      'quantity': quantity.value,
      'price': price.value,
      'size': size,
    };
  }

  CartProductModel copyWith({
    String? id,
    String? title,
    String? color,
    String? imageUrl,
    int? quantity,
    double? price,
    String? size,
  }) {
    return CartProductModel(
      id: id ?? this.id,
      title: title ?? this.title,
      color: color ?? this.color,
      imageUrl: imageUrl ?? this.imageUrl,
      quantity: quantity ?? this.quantity.value,
      price: price ?? this.price.value,
      size: size ?? this.size,
    );
  }
}
