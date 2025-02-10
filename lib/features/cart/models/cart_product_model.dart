class CartProductModel {
  final String id;
  final String title;
  final String imageUrl;
  final int quantity;
  final double price;
  final String size;

  CartProductModel(
     {
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.quantity,
    required this.price,
    required this.size,

  });

  factory CartProductModel.fromJson(Map<String, dynamic> json) {
    return CartProductModel(
      id: json['id'],
      title: json['title'],
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
      'imageUrl': imageUrl,
      'quantity': quantity,
      'price': price,
      'size': size,
    };
  }

  CartProductModel copyWith({
    String? id,
    String? title,
    String? imageUrl,
    int? quantity,
    double? price,
    String? size,
  }) {
    return CartProductModel(
      id: id ?? this.id,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      size: size ?? this.size,
    );
  }
}

