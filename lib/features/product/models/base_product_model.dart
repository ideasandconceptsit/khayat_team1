class BaseProductModel {
  final String id;
  final String name;
  final String unit;
  final String location;
  final int quantity;
  final double discount;
  final int minStock;
  final int maxStock;
  final bool active;
  final DateTime createdAt;
  final DateTime updatedAt;
  final double ratingsAverage;
  final int ratingsQuantity;
  final String slug;
  final bool isLowStock;
  final bool isOverStocked;
  final double profitMargin;
  final double? totalCost;
  final double totalValue;
  final Category category;
  final List<String>? images;
  final double price; // هنا السعر العام


  BaseProductModel({
    required this.price,
    required this.id,
    required this.name,
    required this.unit,
    required this.location,
    required this.quantity,
    required this.discount,
    required this.minStock,
    required this.maxStock,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
    required this.ratingsAverage,
    required this.ratingsQuantity,
    required this.slug,
    required this.isLowStock,
    required this.isOverStocked,
    required this.profitMargin,
    required this.totalCost,
    required this.totalValue,
    required this.category,
     this.images,
  });

  factory BaseProductModel.fromJson(Map<String, dynamic> json) {
    return BaseProductModel(
      id: json['id'],
      name: json['name'],
      unit: json['unit'],
      location: json['location'],
      quantity: json['quantity'],
      discount: (json['discount'] as num).toDouble(),
      minStock: json['minStock'],
      maxStock: json['maxStock'],
      active: json['active'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      ratingsAverage: (json['ratingsAverage'] as num).toDouble(),
      ratingsQuantity: json['ratingsQuantity'],
      slug: json['slug'],
      isLowStock: json['isLowStock'],
      isOverStocked: json['isOverStocked'],
      profitMargin: (json['profitMargin'] as num).toDouble(),
      totalCost: json['totalCost'] != null ? (json['totalCost'] as num).toDouble() : null,
      totalValue: (json['totalValue'] as num).toDouble(),
      category: Category.fromJson(json['category']),
      images: List<String>.from(json['images']),
      price: (json['price'] as num).toDouble(), // نضيف السعر هنا

    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "unit": unit,
      "location": location,
      "quantity": quantity,
      "discount": discount,
      "minStock": minStock,
      "maxStock": maxStock,
      "active": active,
      "createdAt": createdAt.toIso8601String(),
      "updatedAt": updatedAt.toIso8601String(),
      "ratingsAverage": ratingsAverage,
      "ratingsQuantity": ratingsQuantity,
      "slug": slug,
      "isLowStock": isLowStock,
      "isOverStocked": isOverStocked,
      "profitMargin": profitMargin,
      "totalCost": totalCost,
      "totalValue": totalValue,
      "category": category.toJson(),
      "images": images,
    };
  }
}
class AccessoryProductModel extends BaseProductModel {
  final String? image;
  final Supplier supplier;
  final double pricePerUnit;
  final String sku;
  final List<String> tags;

  AccessoryProductModel({
    required super.price,
    required super.id,
    required super.name,
    required super.unit,
    required super.location,
    required super.quantity,
    required super.discount,
    required super.minStock,
    required super.maxStock,
    required super.active,
    required super.createdAt,
    required super.updatedAt,
    required super.ratingsAverage,
    required super.ratingsQuantity,
    required super.slug,
    required super.isLowStock,
    required super.isOverStocked,
    required super.profitMargin,
    required super.totalCost,
    required super.totalValue,
    required super.category,
    required super.images,
    this.image,
    required this.supplier,
    required this.pricePerUnit,
    required this.sku,
    required this.tags,
  });

  factory AccessoryProductModel.fromJson(Map<String, dynamic> json) {
    return AccessoryProductModel(
      price: (json['price'] as num).toDouble(),
      id: json['id'],
      name: json['name'],
      unit: json['unit'],
      location: json['location'],
      quantity: json['quantity'],
      discount: (json['discount'] as num).toDouble(),
      minStock: json['minStock'],
      maxStock: json['maxStock'],
      active: json['active'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      ratingsAverage: (json['ratingsAverage'] as num).toDouble(),
      ratingsQuantity: json['ratingsQuantity'],
      slug: json['slug'],
      isLowStock: json['isLowStock'],
      isOverStocked: json['isOverStocked'],
      profitMargin: (json['profitMargin'] as num).toDouble(),
      totalCost: json['totalCost'] != null ? (json['totalCost'] as num).toDouble() : null,
      totalValue: (json['totalValue'] as num).toDouble(),
      category: Category.fromJson(json['category']),
      images: List<String>.from(json['images']),
      image: json['image'],
      supplier: Supplier.fromJson(json['supplier']),
      pricePerUnit: (json['pricePerUnit'] as num).toDouble(),
      sku: json['sku'],
      tags: List<String>.from(json['tags']),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "price": price,
      "name": name,
      "unit": unit,
      "location": location,
      "quantity": quantity,
      "discount": discount,
      "minStock": minStock,
      "maxStock": maxStock,
      "active": active,
      "createdAt": createdAt.toIso8601String(),
      "updatedAt": updatedAt.toIso8601String(),
      "ratingsAverage": ratingsAverage,
      "ratingsQuantity": ratingsQuantity,
      "slug": slug,
      "isLowStock": isLowStock,
      "isOverStocked": isOverStocked,
      "profitMargin": profitMargin,
      "totalCost": totalCost,
      "totalValue": totalValue,
      "category": category.toJson(),
      "images": images,
      "image": image,
      "supplier": supplier.toJson(),
      "pricePerUnit": pricePerUnit,
      "sku": sku,
      "tags": tags,
    };
  }
}
class FabricProductModel extends BaseProductModel {
  final double pricePerMeter;

  FabricProductModel({
    required super.id,
    required super.price,
    required super.name,
    required super.unit,
    required super.location,
    required super.quantity,
    required super.discount,
    required super.minStock,
    required super.maxStock,
    required super.active,
    required super.createdAt,
    required super.updatedAt,
    required super.ratingsAverage,
    required super.ratingsQuantity,
    required super.slug,
    required super.isLowStock,
    required super.isOverStocked,
    required super.profitMargin,
    required super.totalCost,
    required super.totalValue,
    required super.category,
     super.images,
    required this.pricePerMeter,
  });

  factory FabricProductModel.fromJson(Map<String, dynamic> json) {
    return FabricProductModel(
      id: json['id'],
      price: (json['price'] as num).toDouble(),

      name: json['name'],
      unit: json['unit'],
      location: json['location'],
      quantity: json['quantity'],
      discount: (json['discount'] as num).toDouble(),
      minStock: json['minStock'],
      maxStock: json['maxStock'],
      active: json['active'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      ratingsAverage: (json['ratingsAverage'] as num).toDouble(),
      ratingsQuantity: json['ratingsQuantity'],
      slug: json['slug'],
      isLowStock: json['isLowStock'],
      isOverStocked: json['isOverStocked'],
      profitMargin: (json['profitMargin'] as num).toDouble(),
      totalCost: json['totalCost'] != null ? (json['totalCost'] as num).toDouble() : null,
      totalValue: (json['totalValue'] as num).toDouble(),
      category: Category.fromJson(json['category']),
      images: List<String>.from(json['images']),
      pricePerMeter: (json['pricePerMeter'] as num).toDouble(),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "price": price,
      "name": name,
      "unit": unit,
      "location": location,
      "quantity": quantity,
      "discount": discount,
      "minStock": minStock,
      "maxStock": maxStock,
      "active": active,
      "createdAt": createdAt.toIso8601String(),
      "updatedAt": updatedAt.toIso8601String(),
      "ratingsAverage": ratingsAverage,
      "ratingsQuantity": ratingsQuantity,
      "slug": slug,
      "isLowStock": isLowStock,
      "isOverStocked": isOverStocked,
      "profitMargin": profitMargin,
      "totalCost": totalCost,
      "totalValue": totalValue,
      "category": category.toJson(),
      "images": images,
      "pricePerMeter": pricePerMeter,
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

