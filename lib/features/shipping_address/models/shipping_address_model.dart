import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

// Address Model
class ShippingAddressModel {
  String id;
  String user;
  String name;
  String addressLine1;
  String addressLine2;
  String city;
  String state;
  String postalCode;
  String country;
  String phone;
  bool isDefault;
  String addressType;
  DateTime createdAt;
  DateTime updatedAt;

  ShippingAddressModel({
    required this.id,
    required this.user,
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

  factory ShippingAddressModel.fromJson(Map<String, dynamic> json) {
    // Print the raw JSON for debugging
    print('Parsing address JSON: $json');

    // Handle both '_id' and 'id' fields from API
    String addressId = json['_id'] ?? json['id'] ?? '';

    return ShippingAddressModel(
      id: addressId,
      user: json['user'] ?? '',
      name: json['name'] ?? 'Unnamed',
      addressLine1: json['addressLine1'] ?? 'No Address',
      addressLine2: json['addressLine2'] ?? '',
      city: json['city'] ?? 'Unknown City',
      state: json['state'] ?? '',
      postalCode: json['postalCode'] ?? '',
      country: json['country'] ?? 'Unknown Country',
      phone: json['phone'] ?? '',
      isDefault: json['isDefault'] ?? false,
      addressType: json['addressType'] ?? '',
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : DateTime.now(),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : DateTime.now(),
    );
  }

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
      "isDefault": isDefault,
      "addressType": addressType,
    };
  }

  // Add equals and hashCode for proper comparison
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ShippingAddressModel && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  // Add toString for better debugging
  @override
  String toString() {
    return 'Address{id: $id, name: $name, city: $city}';
  }
}
