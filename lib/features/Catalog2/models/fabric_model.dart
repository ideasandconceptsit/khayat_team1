import 'category_model.dart';

class FabricModel {
  final String id;
  final String name;
  final CategoryModel category;
  final int quantity;
  final double pricePerMeter;
  final int discount;
  final int minStock;
  final int maxStock;
  final bool active;
  final String createdAt;
  final String updatedAt;
  final String imageUrl;

  FabricModel({
    required this.id,
    required this.name,
    required this.category,
    required this.quantity,
    required this.pricePerMeter,
    this.discount = 0,
    required this.minStock,
    required this.maxStock,
    this.active = true,
    required this.createdAt,
    required this.updatedAt,
    this.imageUrl = '',
  });

  factory FabricModel.fromJson(Map<String, dynamic> json) {
    return FabricModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      category: CategoryModel.fromJson(json['category'] ?? {}),
      quantity: json['quantity'] ?? 0,
      pricePerMeter: (json['pricePerMeter'] ?? 0).toDouble(),
      discount: json['discount'] ?? 0,
      minStock: json['minStock'] ?? 0,
      maxStock: json['maxStock'] ?? 0,
      active: json['active'] ?? true,
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      imageUrl: json['imageUrl'] ?? 'assets/images/fabric.jpeg',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'category': category.toJson(),
      'quantity': quantity,
      'pricePerMeter': pricePerMeter,
      'discount': discount,
      'minStock': minStock,
      'maxStock': maxStock,
      'active': active,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'imageUrl': imageUrl,
    };
  }

  // Calculate price after discount
  double get finalPrice {
    if (discount <= 0) return pricePerMeter;
    return pricePerMeter - (pricePerMeter * discount / 100);
  }
}
