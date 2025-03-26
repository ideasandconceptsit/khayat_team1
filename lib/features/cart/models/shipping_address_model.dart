class ShippingAddressModel {
  final String id;
  final String fullName;
  final String address;
  final String city;
  final String state;
  String? zipCode;
  final String country;

  ShippingAddressModel({this.zipCode,required this.id, required this.fullName, required this.address, required this.city, required this.state, required this.country});


  factory ShippingAddressModel.fromJson(Map<String, dynamic> json) {
    return ShippingAddressModel(
      id: json['_id'],
      fullName: json['name'],
      address: json['addressLine1'],
      city: json['city'],
      state: json['state'],
      country: json['country'],
      zipCode: json['postalCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'address': address,
      'city': city,
      'state': state,
      'country': country,
      'zipCode': zipCode,
    };
  }

  ShippingAddressModel copyWith({
    String? id,
    String? fullName,
    String? address,
    String? city,
    String? state,
    String? zipCode,
    String? country,
  }) {
    return ShippingAddressModel(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      address: address ?? this.address,
      city: city ?? this.city,
      state: state ?? this.state,
      country: country ?? this.country,
      zipCode: zipCode ?? this.zipCode,
    );
  }

}