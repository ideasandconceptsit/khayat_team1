import 'category_model.dart';
import 'supplier_model.dart';

enum ProductType { fabric, accessory }

class ProductModel {
  final String id;
  final String name;
  final String slug;
  final CategoryModel category;
  final SupplierModel? supplier;
  final double quantity;
  final String unit;
  final double price;
  final int discount;
  final int minStock;
  final int maxStock;
  final bool active;
  final String createdAt;
  final String updatedAt;
  final String image;
  final String? location;
  final double ratingsAverage;
  final int ratingsQuantity;
  final bool isLowStock;
  final bool isOverStocked;
  final double profitMargin;
  final double totalValue;
  final double? totalCost;
  final String? sku;
  final List<String>? tags;
  final List<String>? images;
  final ProductType type;

  ProductModel({
    required this.id,
    required this.name,
    this.slug = '',
    required this.category,
    this.supplier,
    required this.quantity,
    required this.unit,
    required this.price,
    this.discount = 0,
    required this.minStock,
    required this.maxStock,
    this.active = true,
    required this.createdAt,
    required this.updatedAt,
    required this.image,
    this.location,
    this.ratingsAverage = 0.0,
    this.ratingsQuantity = 0,
    this.isLowStock = false,
    this.isOverStocked = false,
    this.profitMargin = 0.0,
    this.totalValue = 0.0,
    this.totalCost,
    this.sku,
    this.tags,
    this.images,
    required this.type,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    final isFabric = json['unit'] == 'meter' ||
        (json['category']?['name']?.toString().contains('قماش') ?? false);

    return ProductModel(
      id: json['_id'] ?? json['id'] ?? '',
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      category: CategoryModel.fromJson(json['category'] ?? {}),
      supplier: json['supplier'] != null
          ? SupplierModel.fromJson(json['supplier'])
          : null,
      quantity: (json['quantity'] as num?)?.toDouble() ?? 0,
      unit: json['unit'] ?? (isFabric ? 'meter' : 'piece'),
      price: (json['pricePerUnit'] ?? json['pricePerMeter'] ?? 0).toDouble(),
      discount: json['discount'] ?? 0,
      minStock: json['minStock'] ?? 0,
      maxStock: json['maxStock'] ?? 0,
      active: json['active'] ?? true,
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      image: json['image'] ?? '',
      location: json['location'],
      ratingsAverage: (json['ratingsAverage'] ?? 0).toDouble(),
      ratingsQuantity: json['ratingsQuantity'] ?? 0,
      isLowStock: json['isLowStock'] ?? false,
      isOverStocked: json['isOverStocked'] ?? false,
      profitMargin: (json['profitMargin'] ?? 0).toDouble(),
      totalValue: (json['totalValue'] ?? 0).toDouble(),
      totalCost: json['totalCost']?.toDouble(),
      sku: json['sku'],
      tags: json['tags'] != null ? List<String>.from(json['tags']) : null,
      images: json['images'] != null ? List<String>.from(json['images']) : null,
      type: isFabric ? ProductType.fabric : ProductType.accessory,
    );
  }

  double get finalPrice => price - (price * discount / 100);
  String get formattedPrice => '\$${finalPrice.toStringAsFixed(2)}';
}
