class AccessoriesModels {
  final int results;
  final int page;
  final List<ProductAccessories> data;

  AccessoriesModels({
    required this.results,
    required this.page,
    required this.data,
  });

  factory AccessoriesModels.fromJson(Map<String, dynamic> json) {
    return AccessoriesModels(
      results: json['results'] ?? 0,
      page: json['page'] ?? 0,
      data: List<ProductAccessories>.from(
        json['data']?.map((product) => ProductAccessories.fromJson(product)) ?? [],
      ),
    );
  }
}

class ProductAccessories {
  final String id;
  final String name;
  final String? slug;
  final Category category;
  final Supplier? supplier;
  final int quantity;
  final String? unit;
  final double pricePerUnit;
  final int ratingsAverage;
  final int ratingsQuantity;
  final double discount;
  final int minStock;
  final int maxStock;
  final bool isLowStock;
  final bool isOverStocked;
  final double totalValue;
  final String? sku;

  ProductAccessories({
    required this.id,
    required this.name,
    this.slug,
    required this.category,
    this.supplier,
    required this.quantity,
    this.unit,
    required this.pricePerUnit,
    required this.ratingsAverage,
    required this.ratingsQuantity,
    required this.discount,
    required this.minStock,
    required this.maxStock,
    required this.isLowStock,
    required this.isOverStocked,
    required this.totalValue,
    this.sku,
  });

  factory ProductAccessories.fromJson(Map<String, dynamic> json) {
    return ProductAccessories(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      slug: json['slug'],
      category: Category.fromJson(json['category'] ?? {}),
      supplier: json['supplier'] != null ? Supplier.fromJson(json['supplier']) : null,
      quantity: json['quantity'] ?? 0,
      unit: json['unit'],
      pricePerUnit: json['pricePerUnit']?.toDouble() ?? 0.0,
      ratingsAverage: json['ratingsAverage'] ?? 0,
      ratingsQuantity: json['ratingsQuantity'] ?? 0,
      discount: json['discount']?.toDouble() ?? 0.0,
      minStock: json['minStock'] ?? 0,
      maxStock: json['maxStock'] ?? 0,
      isLowStock: json['isLowStock'] ?? false,
      isOverStocked: json['isOverStocked'] ?? false,
      totalValue: json['totalValue']?.toDouble() ?? 0.0,
      sku: json['sku'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'slug': slug,
      'category': category.toJson(),
      'supplier': supplier?.toJson(),
      'quantity': quantity,
      'unit': unit,
      'pricePerUnit': pricePerUnit,
      'ratingsAverage': ratingsAverage,
      'ratingsQuantity': ratingsQuantity,
      'discount': discount,
      'minStock': minStock,
      'maxStock': maxStock,
      'isLowStock': isLowStock,
      'isOverStocked': isOverStocked,
      'totalValue': totalValue,
      'sku': sku,
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
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
    };
  }
}

class Supplier {
  final String id;
  final String name;
  final String? phone;

  Supplier({
    required this.id,
    required this.name,
    this.phone,
  });

  factory Supplier.fromJson(Map<String, dynamic> json) {
    return Supplier(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
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
