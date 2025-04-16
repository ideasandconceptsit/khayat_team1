import 'product_model.dart';

class CategoryModel {
  final String id;
  final String name;
  final String? description;
  final bool active;
  final String createdAt;
  final String updatedAt;
  final ProductType productType; // إضافة هذا الحقل

  CategoryModel({
    required this.id,
    required this.name,
    this.description = '',
    this.active = true,
    required this.createdAt,
    required this.updatedAt,
    required this.productType,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      active: json['active'] ?? true,
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      productType:
          json['type'] == 'fabric' ? ProductType.fabric : ProductType.accessory,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'description': description,
      'active': active,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
