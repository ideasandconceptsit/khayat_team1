class FabricProductModel {
  final String id;
  final String name;
  final String unit;
  final String location;
  final int quantity;
  final double pricePerMeter;
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

  FabricProductModel({
    required this.id,
    required this.name,
    required this.unit,
    required this.location,
    required this.quantity,
    required this.pricePerMeter,
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
  });

  factory FabricProductModel.fromJson(Map<String, dynamic> json) {
    return FabricProductModel(
      id: json['id'],
      name: json['name'],
      unit: json['unit'],
      location: json['location'],
      quantity: json['quantity'],
      pricePerMeter: (json['pricePerMeter'] as num).toDouble(),
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
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "unit": unit,
      "location": location,
      "quantity": quantity,
      "pricePerMeter": pricePerMeter,
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
