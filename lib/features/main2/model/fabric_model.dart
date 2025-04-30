class FabricModel {
  final String? id;
  final String? name;
  final String? slug;
  final String? unit;
  final String? location;
  final int? quantity;
  final double? pricePerMeter;
  final int? discount;
  final int? minStock;
  final int? maxStock;
  final bool? active;
  final double? ratingsAverage;
  final int? ratingsQuantity;
  final double? totalValue;
  final double? profitMargin;
  final bool? isLowStock;
  final bool? isOverStocked;
  final String? sku;
  final CategoryModel? category;
  final SupplierModel? supplier;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  FabricModel({
    this.id,
    this.name,
    this.slug,
    this.unit,
    this.location,
    this.quantity,
    this.pricePerMeter,
    this.discount,
    this.minStock,
    this.maxStock,
    this.active,
    this.ratingsAverage,
    this.ratingsQuantity,
    this.totalValue,
    this.profitMargin,
    this.isLowStock,
    this.isOverStocked,
    this.sku,
    this.category,
    this.supplier,
    this.createdAt,
    this.updatedAt,
  });

  factory FabricModel.fromJson(Map<String, dynamic> json) {
    return FabricModel(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      unit: json['unit'],
      location: json['location'],
      quantity: json['quantity'],
      pricePerMeter: (json['pricePerMeter'] as num?)?.toDouble(),
      discount: json['discount'],
      minStock: json['minStock'],
      maxStock: json['maxStock'],
      active: json['active'],
      ratingsAverage: (json['ratingsAverage'] as num?)?.toDouble(),
      ratingsQuantity: json['ratingsQuantity'],
      totalValue: (json['totalValue'] as num?)?.toDouble(),
      profitMargin: (json['profitMargin'] as num?)?.toDouble(),
      isLowStock: json['isLowStock'],
      isOverStocked: json['isOverStocked'],
      sku: json['sku'],
      category: json['category'] != null ? CategoryModel.fromJson(json['category']) : null,
      supplier: json['supplier'] != null ? SupplierModel.fromJson(json['supplier']) : null,
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'unit': unit,
      'location': location,
      'quantity': quantity,
      'pricePerMeter': pricePerMeter,
      'discount': discount,
      'minStock': minStock,
      'maxStock': maxStock,
      'active': active,
      'ratingsAverage': ratingsAverage,
      'ratingsQuantity': ratingsQuantity,
      'totalValue': totalValue,
      'profitMargin': profitMargin,
      'isLowStock': isLowStock,
      'isOverStocked': isOverStocked,
      'sku': sku,
      'category': category?.toJson(),
      'supplier': supplier?.toJson(),
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}

class CategoryModel {
  final String? id;
  final String? name;

  CategoryModel({this.id, this.name});

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

class SupplierModel {
  final String? id;
  final String? name;
  final String? phone;

  SupplierModel({this.id, this.name, this.phone});

  factory SupplierModel.fromJson(Map<String, dynamic> json) {
    return SupplierModel(
      id: json['_id'],
      name: json['name'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'phone': phone,
    };
  }
}
