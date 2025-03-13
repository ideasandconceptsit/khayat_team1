import 'category_model.dart';
import 'supplier_model.dart';

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
  final String unit;
  final String location;
  final double ratingsAverage;
  final int ratingsQuantity;
  final bool isLowStock;
  final bool isOverStocked;
  final double profitMargin;
  final double totalValue;
  final double? totalCost;
  final SupplierModel? supplier;

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
    required this.unit,
    required this.location,
    this.ratingsAverage = 0.0,
    this.ratingsQuantity = 0,
    this.isLowStock = false,
    this.isOverStocked = false,
    this.profitMargin = 0.0,
    this.totalValue = 0.0,
    this.totalCost,
    this.supplier,
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
      unit: json['unit'] ?? '',
      location: json['location'] ?? '',
      ratingsAverage: (json['ratingsAverage'] ?? 0).toDouble(),
      ratingsQuantity: json['ratingsQuantity'] ?? 0,
      isLowStock: json['isLowStock'] ?? false,
      isOverStocked: json['isOverStocked'] ?? false,
      profitMargin: (json['profitMargin'] ?? 0).toDouble(),
      totalValue: (json['totalValue'] ?? 0).toDouble(),
      totalCost: json['totalCost'] != null
          ? (json['totalCost'] as num).toDouble()
          : null,
      supplier: json['supplier'] != null
          ? SupplierModel.fromJson(json['supplier'])
          : null,
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
      'unit': unit,
      'location': location,
      'ratingsAverage': ratingsAverage,
      'ratingsQuantity': ratingsQuantity,
      'isLowStock': isLowStock,
      'isOverStocked': isOverStocked,
      'profitMargin': profitMargin,
      'totalValue': totalValue,
      'totalCost': totalCost,
      'supplier': supplier?.toJson(),
    };
  }

  // Calculate price after discount
  double get finalPrice {
    if (discount <= 0) return pricePerMeter;
    return pricePerMeter - (pricePerMeter * discount / 100);
  }
}
