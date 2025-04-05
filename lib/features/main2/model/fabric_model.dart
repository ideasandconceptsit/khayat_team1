class FabricModel {
  final String id;
  final String name;
  final String unit;
  final String location;
  final String? sku;
  final bool active;
  final double pricePerMeter;
  final double discount;
  final int quantity;
  final int minStock;
  final int maxStock;
  final double ratingsAverage;
  final int ratingsQuantity;
  final double totalValue;
  final String createdAt;
  final String updatedAt;
  final String slug;
  final Category category;
  final Supplier? supplier;

  FabricModel({
    required this.id,
    required this.name,
    required this.unit,
    required this.location,
    this.sku,
    required this.active,
    required this.pricePerMeter,
    required this.discount,
    required this.quantity,
    required this.minStock,
    required this.maxStock,
    required this.ratingsAverage,
    required this.ratingsQuantity,
    required this.totalValue,
    required this.createdAt,
    required this.updatedAt,
    required this.slug,
    required this.category,
    this.supplier,
  });

  factory FabricModel.fromJson(Map<String, dynamic> json) {
    return FabricModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      unit: json['unit'] ?? '',
      location: json['location'] ?? '',
      sku: json['sku'] ?? '',
      active: json['active'] ?? false,
      pricePerMeter: (json['pricePerMeter'] ?? 0).toDouble(),
      discount: (json['discount'] ?? 0).toDouble(),
      quantity: json['quantity'] ?? 0,
      minStock: json['minStock'] ?? 0,
      maxStock: json['maxStock'] ?? 0,
      ratingsAverage: (json['ratingsAverage'] ?? 0).toDouble(),
      ratingsQuantity: json['ratingsQuantity'] ?? 0,
      totalValue: (json['totalValue'] ?? 0).toDouble(),
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      slug: json['slug'] ?? '',
      category: Category.fromJson(json['category'] ?? {}),
      supplier: json['supplier'] != null ? Supplier.fromJson(json['supplier']) : null,
    );
  }
}

class Category {
  final String id;
  final String name;

  Category({required this.id, required this.name});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
    );
  }
}

class Supplier {
  final String id;
  final String name;
  final String phone;

  Supplier({required this.id, required this.name, required this.phone});

  factory Supplier.fromJson(Map<String, dynamic> json) {
    return Supplier(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
    );
  }
}
