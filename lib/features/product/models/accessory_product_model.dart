class AccessoryProductModel {
  final String id;
  final String name;
  final String slug;
  final Category category;
  final Supplier supplier;
  final int quantity;
  final String unit;
  final double pricePerUnit;
  final double ratingsAverage;
  final int ratingsQuantity;
  final double discount;
  final int minStock;
  final int maxStock;
  final String? image;
  final bool active;
  final String location;
  final List<String> tags;
  final List<String> images;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String sku;
  final bool isLowStock;
  final bool isOverStocked;
  final double profitMargin;
  final double? totalCost;
  final double totalValue;

  AccessoryProductModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.category,
    required this.supplier,
    required this.quantity,
    required this.unit,
    required this.pricePerUnit,
    required this.ratingsAverage,
    required this.ratingsQuantity,
    required this.discount,
    required this.minStock,
    required this.maxStock,
    this.image,
    required this.active,
    required this.location,
    required this.tags,
    required this.images,
    required this.createdAt,
    required this.updatedAt,
    required this.sku,
    required this.isLowStock,
    required this.isOverStocked,
    required this.profitMargin,
    required this.totalCost,
    required this.totalValue,
  });

  factory AccessoryProductModel.fromJson(Map<String, dynamic> json) {
    return AccessoryProductModel(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      category: Category.fromJson(json['category']),
      supplier: Supplier.fromJson(json['supplier']),
      quantity: json['quantity'],
      unit: json['unit'],
      pricePerUnit: (json['pricePerUnit'] as num).toDouble(),
      ratingsAverage: (json['ratingsAverage'] as num).toDouble(),
      ratingsQuantity: json['ratingsQuantity'],
      discount: (json['discount'] as num).toDouble(),
      minStock: json['minStock'],
      maxStock: json['maxStock'],
      image: json['image'],
      active: json['active'],
      location: json['location'],
      tags: List<String>.from(json['tags']),
      images: List<String>.from(json['images']),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      sku: json['sku'],
      isLowStock: json['isLowStock'],
      isOverStocked: json['isOverStocked'],
      profitMargin: (json['profitMargin'] as num).toDouble(),
      totalCost: json['totalCost'] != null ? (json['totalCost'] as num).toDouble() : null,
      totalValue: (json['totalValue'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "slug": slug,
      "category": category.toJson(),
      "supplier": supplier.toJson(),
      "quantity": quantity,
      "unit": unit,
      "pricePerUnit": pricePerUnit,
      "ratingsAverage": ratingsAverage,
      "ratingsQuantity": ratingsQuantity,
      "discount": discount,
      "minStock": minStock,
      "maxStock": maxStock,
      "image": image,
      "active": active,
      "location": location,
      "tags": tags,
      "images": images,
      "createdAt": createdAt.toIso8601String(),
      "updatedAt": updatedAt.toIso8601String(),
      "sku": sku,
      "isLowStock": isLowStock,
      "isOverStocked": isOverStocked,
      "profitMargin": profitMargin,
      "totalCost": totalCost,
      "totalValue": totalValue,
    };
  }
}

class Category {
  final String id;
  final String name;

  Category({
    required this.id,
    required this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['_id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "name": name,
    };
  }
}

class Supplier {
  final String id;
  final String name;
  final String phone;

  Supplier({
    required this.id,
    required this.name,
    required this.phone,
  });

  factory Supplier.fromJson(Map<String, dynamic> json) {
    return Supplier(
      id: json['_id'],
      name: json['name'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "name": name,
      "phone": phone,
    };
  }
}
