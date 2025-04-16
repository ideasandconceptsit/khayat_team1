class PromoCodeModel {
  final String id;
  final String name;
  final String code;
  final int discount;
  final String description;
  final DateTime expiresAt;
  final double minCartPrice;
  final int maxUsage;
  final int usageCount;
  final bool active;

  PromoCodeModel({
    required this.id,
    required this.name,
    required this.code,
    required this.discount,
    required this.description,
    required this.expiresAt,
    required this.minCartPrice,
    required this.maxUsage,
    required this.usageCount,
    required this.active,
  });

  factory PromoCodeModel.fromJson(Map<String, dynamic> json) {
    return PromoCodeModel(
      id: json['_id'],
      name: json['name'],
      code: json['code'],
      discount: json['discount'],
      description: json['description'],
      expiresAt: DateTime.parse(json['expiresAt']),
      minCartPrice: json['minCartPrice'].toDouble(),
      maxUsage: json['maxUsage'],
      usageCount: json['usageCount'],
      active: json['active'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'code': code,
      'discount': discount,
      'description': description,
      'expiresAt': expiresAt.toIso8601String(),
      'minCartPrice': minCartPrice,
      'maxUsage': maxUsage,
      'usageCount': usageCount,
      'active': active,
    };
  }
}
