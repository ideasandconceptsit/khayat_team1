class AddressModel {
  final String id;
  final String userId;
  final String name;
  final String addressLine1;
  final String addressLine2;
  final String city;
  final String state;
  final String postalCode;
  final String country;
  final String phone;
  final bool isDefault;
  final String addressType;
  final DateTime createdAt;
  final DateTime updatedAt;

  AddressModel({
    required this.id,
    required this.userId,
    required this.name,
    required this.addressLine1,
    required this.addressLine2,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.country,
    required this.phone,
    required this.isDefault,
    required this.addressType,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      id: json["_id"] ?? '',
      userId: json["user"] ?? '',
      name: json["name"] ?? '',
      addressLine1: json["addressLine1"] ?? '',
      addressLine2: json["addressLine2"] ?? '',
      city: json["city"] ?? '',
      state: json["state"] ?? '',
      postalCode: json["postalCode"] ?? '',
      country: json["country"] ?? '',
      phone: json["phone"] ?? '',
      isDefault: json["isDefault"] ?? false,
      addressType: json["addressType"] ?? '',
      createdAt: json["createdAt"] != null ? DateTime.parse(json["createdAt"]) : DateTime.now(),
      updatedAt: json["updatedAt"] != null ? DateTime.parse(json["updatedAt"]) : DateTime.now(),
    );
  }
}
