class CouponModel {
  final String id;
  final String name;
  final String code;
  final int discount;
  final String description;
  final DateTime expiresAt;
  final String createdBy;
  final int minCartPrice;
  final int maxUsage;
  final int usageCount;
  final bool active;
  final DateTime createdAt;
  final DateTime updatedAt;

  CouponModel({
    required this.id,
    required this.name,
    required this.code,
    required this.discount,
    required this.description,
    required this.expiresAt,
    required this.createdBy,
    required this.minCartPrice,
    required this.maxUsage,
    required this.usageCount,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CouponModel.fromJson(Map<String, dynamic> json) {
    return CouponModel(
      id: json["_id"],
      name: json["name"],
      code: json["code"],
      discount: json["discount"],
      description: json["description"],
      expiresAt: DateTime.parse(json["expiresAt"]),
      createdBy: json["createdBy"]["name"],
      minCartPrice: json["minCartPrice"],
      maxUsage: json["maxUsage"],
      usageCount: json["usageCount"],
      active: json["active"],
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "name": name,
      "code": code,
      "discount": discount,
      "description": description,
      "expiresAt": expiresAt.toIso8601String(),
      "createdBy": {"name": createdBy},
      "minCartPrice": minCartPrice,
      "maxUsage": maxUsage,
      "usageCount": usageCount,
      "active": active,
      "createdAt": createdAt.toIso8601String(),
      "updatedAt": updatedAt.toIso8601String(),
    };
  }
}