class BaseProductModel {
  final String id;
  final String? name;
  final String? unit;
  final String? location;
  final int? quantity;
  final double? discount;
  final int? minStock;
  final int? maxStock;
  final bool? active;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final double? ratingsAverage;
  final int? ratingsQuantity;
  final String? slug;
  final bool? isLowStock;
  final bool? isOverStocked;
  final double? profitMargin;
  final double? totalCost;
  final double? totalValue;
  final Category? category;
  final double? price;
  final List<String>? colors;
  final List<String>? sizes;
  final List<String>? images;

  BaseProductModel({
    this.price,
    required this.id,
    this.name,
    this.unit,
    this.location,
    this.quantity,
    this.discount,
    this.minStock,
    this.maxStock,
    this.active,
    this.createdAt,
    this.updatedAt,
    this.ratingsAverage,
    this.ratingsQuantity,
    this.slug,
    this.isLowStock,
    this.isOverStocked,
    this.profitMargin,
    this.totalCost,
    this.totalValue,
    this.category,
    this.colors,
    this.sizes,
    this.images,
  });

  factory BaseProductModel.fromJson(Map<String, dynamic> json) {
    return BaseProductModel(
      id: json['_id'] as String,
      name: json['name'] as String?,
      unit: json['unit'] as String?,
      location: json['location'] as String?,
      quantity: json['quantity'] as int?,
      discount: (json['discount'] as num?)?.toDouble(),
      minStock: json['minStock'] as int?,
      maxStock: json['maxStock'] as int?,
      active: json['active'] as bool?,
      createdAt: json['createdAt'] != null ? DateTime.tryParse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.tryParse(json['updatedAt']) : null,
      ratingsAverage: (json['ratingsAverage'] as num?)?.toDouble(),
      ratingsQuantity: json['ratingsQuantity'] as int?,
      slug: json['slug'] as String?,
      isLowStock: json['isLowStock'] as bool?,
      isOverStocked: json['isOverStocked'] as bool?,
      profitMargin: (json['profitMargin'] as num?)?.toDouble(),
      totalCost: (json['totalCost'] as num?)?.toDouble(),
      totalValue: (json['totalValue'] as num?)?.toDouble(),
      category: json['category'] != null ? Category.fromJson(json['category']) : null,
      images: (json['images'] as List?)?.map((e) => e as String).toList(),
      colors: (json['colors'] as List?)?.map((e) => e as String).toList(),
      sizes: (json['sizes'] as List?)?.map((e) => e as String).toList(),
      price: (json['price'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "name": name,
      "unit": unit,
      "location": location,
      "quantity": quantity,
      "discount": discount,
      "minStock": minStock,
      "maxStock": maxStock,
      "active": active,
      "createdAt": createdAt?.toIso8601String(),
      "updatedAt": updatedAt?.toIso8601String(),
      "ratingsAverage": ratingsAverage,
      "ratingsQuantity": ratingsQuantity,
      "slug": slug,
      "isLowStock": isLowStock,
      "isOverStocked": isOverStocked,
      "profitMargin": profitMargin,
      "totalCost": totalCost,
      "totalValue": totalValue,
      "category": category?.toJson(),
      "images": images,
      "colors": colors,
      "sizes": sizes,
      "price": price,
    };
  }
}

class AccessoryProductModel extends BaseProductModel {
  final String? image;
  final Supplier? supplier;
  final double? pricePerUnit;
  final String? sku;
  final List<String>? tags;

  AccessoryProductModel({
    super.price,
    required super.id,
    super.name,
    super.unit,
    super.location,
    super.quantity,
    super.discount,
    super.minStock,
    super.maxStock,
    super.active,
    super.createdAt,
    super.updatedAt,
    super.ratingsAverage,
    super.ratingsQuantity,
    super.slug,
    super.isLowStock,
    super.isOverStocked,
    super.profitMargin,
    super.totalCost,
    super.totalValue,
    super.category,
    super.images,
    super.colors,
    super.sizes,
    this.image,
    this.supplier,
    this.pricePerUnit,
    this.sku,
    this.tags,
  });

  factory AccessoryProductModel.fromJson(Map<String, dynamic> json) {
    return AccessoryProductModel(
      price: (json['price'] as num?)?.toDouble(),
      id: json['_id'] as String,
      name: json['name'] as String?,
      unit: json['unit'] as String?,
      location: json['location'] as String?,
      quantity: json['quantity'] as int?,
      discount: (json['discount'] as num?)?.toDouble(),
      minStock: json['minStock'] as int?,
      maxStock: json['maxStock'] as int?,
      active: json['active'] as bool?,
      createdAt: json['createdAt'] != null ? DateTime.tryParse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.tryParse(json['updatedAt']) : null,
      ratingsAverage: (json['ratingsAverage'] as num?)?.toDouble(),
      ratingsQuantity: json['ratingsQuantity'] as int?,
      slug: json['slug'] as String?,
      isLowStock: json['isLowStock'] as bool?,
      isOverStocked: json['isOverStocked'] as bool?,
      profitMargin: (json['profitMargin'] as num?)?.toDouble(),
      totalCost: (json['totalCost'] as num?)?.toDouble(),
      totalValue: (json['totalValue'] as num?)?.toDouble(),
      category: json['category'] != null ? Category.fromJson(json['category']) : null,
      images: (json['images'] as List?)?.map((e) => e as String).toList(),
      colors: (json['colors'] as List?)?.map((e) => e as String).toList(),
      sizes: (json['sizes'] as List?)?.map((e) => e as String).toList(),
      image: json['image'] as String?,
      supplier: json['supplier'] != null ? Supplier.fromJson(json['supplier']) : null,
      pricePerUnit: (json['pricePerUnit'] as num?)?.toDouble(),
      sku: json['sku'] as String?,
      tags: (json['tags'] as List?)?.map((e) => e as String).toList(),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return super.toJson()
      ..addAll({
        "image": image,
        "supplier": supplier?.toJson(),
        "pricePerUnit": pricePerUnit,
        "sku": sku,
        "tags": tags,
      });
  }
}

class FabricProductModel extends BaseProductModel {
  final double? pricePerMeter;

  FabricProductModel({
    required super.id,
    super.price,
    super.name,
    super.unit,
    super.location,
    super.quantity,
    super.discount,
    super.minStock,
    super.maxStock,
    super.active,
    super.createdAt,
    super.updatedAt,
    super.ratingsAverage,
    super.ratingsQuantity,
    super.slug,
    super.isLowStock,
    super.isOverStocked,
    super.profitMargin,
    super.totalCost,
    super.totalValue,
    super.category,
    super.images,
    super.colors,
    super.sizes,
    this.pricePerMeter,
  });

  factory FabricProductModel.fromJson(Map<String, dynamic> json) {
    return FabricProductModel(
      id: json['id'] as String,
      price: (json['price'] as num?)?.toDouble(),
      name: json['name'] as String?,
      unit: json['unit'] as String?,
      location: json['location'] as String?,
      quantity: json['quantity'] as int?,
      discount: (json['discount'] as num?)?.toDouble(),
      minStock: json['minStock'] as int?,
      maxStock: json['maxStock'] as int?,
      active: json['active'] as bool?,
      createdAt: json['createdAt'] != null ? DateTime.tryParse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.tryParse(json['updatedAt']) : null,
      ratingsAverage: (json['ratingsAverage'] as num?)?.toDouble(),
      ratingsQuantity: json['ratingsQuantity'] as int?,
      slug: json['slug'] as String?,
      isLowStock: json['isLowStock'] as bool?,
      isOverStocked: json['isOverStocked'] as bool?,
      profitMargin: (json['profitMargin'] as num?)?.toDouble(),
      totalCost: (json['totalCost'] as num?)?.toDouble(),
      totalValue: (json['totalValue'] as num?)?.toDouble(),
      category: json['category'] != null ? Category.fromJson(json['category']) : null,
      images: (json['images'] as List?)?.map((e) => e as String).toList(),
      colors: (json['colors'] as List?)?.map((e) => e as String).toList(),
      sizes: (json['sizes'] as List?)?.map((e) => e as String).toList(),
      pricePerMeter: (json['pricePerMeter'] as num?)?.toDouble(),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return super.toJson()
      ..addAll({
        "pricePerMeter": pricePerMeter,
      });
  }
}


class Category {
  final String? id;
  final String? name;

  Category({
    this.id,
    this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['_id'] as String?,
      name: json['name'] as String?,
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

