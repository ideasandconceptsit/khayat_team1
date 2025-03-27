class AddAddressModel {
  final String name;
  final String addressLine1;
  final String addressLine2;
  final String city;
  final String state;
  final String postalCode;
  final String country;
  final String phone;
  final String addressType;

  AddAddressModel({
    required this.name,
    required this.addressLine1,
    required this.addressLine2,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.country,
    required this.phone,
    required this.addressType,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "addressLine1": addressLine1,
      "addressLine2": addressLine2,
      "city": city,
      "state": state,
      "postalCode": postalCode,
      "country": country,
      "phone": phone,
      "addressType": addressType,
    };
  }

  factory AddAddressModel.fromJson(Map<String, dynamic> json) {
    return AddAddressModel(
      name: json["name"] ?? "",
      addressLine1: json["addressLine1"] ?? "",
      addressLine2: json["addressLine2"] ?? "",
      city: json["city"] ?? "",
      state: json["state"] ?? "",
      postalCode: json["postalCode"] ?? "",
      country: json["country"] ?? "",
      phone: json["phone"] ?? "",
      addressType: json["addressType"] ?? "home",
    );
  }
}
