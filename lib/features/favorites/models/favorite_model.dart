// favorite_model.dart
class FavoriteResponse {
  final String status;
  final int results;
  final List<FavoriteItem> data;

  FavoriteResponse({
    required this.status,
    required this.results,
    required this.data,
  });

  factory FavoriteResponse.fromJson(Map<String, dynamic> json) {
    return FavoriteResponse(
      status: json['status'] ?? 'error', // Handle null status
      results: json['results'] ?? 0, // Handle null results
      data: json['data'] != null
          ? List<FavoriteItem>.from(
              json['data'].map((x) => FavoriteItem.fromJson(x ?? {})))
          : <FavoriteItem>[], // Provide empty list if null
    );
  }
}

class FavoriteItem {
  final String id;
  final String name;
  final String slug;
  final FavoriteCategory category;
  final FavoriteSupplier supplier;
  final int quantity;
  final String unit;
  final double pricePerUnit;
  final double ratingsAverage;
  final int ratingsQuantity;
  final int discount;
  final int minStock;
  final int maxStock;
  final String image;
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
  final double totalValue;
  final double? totalCost;

  FavoriteItem({
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
    required this.image,
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
    required this.totalValue,
    this.totalCost,
  });

  factory FavoriteItem.fromJson(Map<String, dynamic> json) {
    json ??= {}; // Handle null json

    return FavoriteItem(
      id: json['_id'] ?? json['id'] ?? '',
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      category: FavoriteCategory.fromJson(json['category'] ?? {}),
      supplier: FavoriteSupplier.fromJson(json['supplier'] ?? {}),
      quantity: json['quantity'] ?? 0,
      unit: json['unit'] ?? 'piece',
      pricePerUnit:
          (json['pricePerUnit'] ?? json['pricePerMeter'] ?? 0).toDouble(),
      ratingsAverage: (json['ratingsAverage'] ?? 0).toDouble(),
      ratingsQuantity: json['ratingsQuantity'] ?? 0,
      discount: json['discount'] ?? 0,
      minStock: json['minStock'] ?? 0,
      maxStock: json['maxStock'] ?? 0,
      image: json['image'] ?? '',
      active: json['active'] ?? true,
      location: json['location'] ?? '',
      tags: List<String>.from(json['tags'] ?? []),
      images: List<String>.from(json['images'] ?? []),
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : DateTime.now(),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : DateTime.now(),
      sku: json['sku'] ?? '',
      isLowStock: json['isLowStock'] ?? false,
      isOverStocked: json['isOverStocked'] ?? false,
      profitMargin: (json['profitMargin'] ?? 0).toDouble(),
      totalValue: (json['totalValue'] ?? 0).toDouble(),
      totalCost: json['totalCost']?.toDouble(),
    );
  }
}

class FavoriteCategory {
  final String id;
  final String name;

  FavoriteCategory({
    required this.id,
    required this.name,
  });

  factory FavoriteCategory.fromJson(Map<String, dynamic> json) {
    json ??= {};
    return FavoriteCategory(
      id: json['_id'] ?? json['id'] ?? '',
      name: json['name'] ?? '',
    );
  }
}

class FavoriteSupplier {
  final String id;
  final String name;
  final String phone;

  FavoriteSupplier({
    required this.id,
    required this.name,
    required this.phone,
  });

  factory FavoriteSupplier.fromJson(Map<String, dynamic> json) {
    json ??= {};
    return FavoriteSupplier(
      id: json['_id'] ?? json['id'] ?? '',
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
    );
  }
}

class FavoriteOperationResponse {
  final String status;
  final String message;
  final List<String> data;

  FavoriteOperationResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory FavoriteOperationResponse.fromJson(Map<String, dynamic> json) {
    json ??= {};
    return FavoriteOperationResponse(
      status: json['status'] ?? 'error',
      message: json['message'] ?? '',
      data: List<String>.from(json['data'] ?? []),
    );
  }
}
