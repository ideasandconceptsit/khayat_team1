import 'dart:developer';

import 'package:get/get.dart';
import 'package:team1_khayat/core/service/api_service.dart';
import 'package:team1_khayat/core/service/end_point.dart';
import 'package:team1_khayat/features/profile/model/add_address_model.dart';
import 'package:team1_khayat/features/profile/model/address_model.dart';
import 'package:team1_khayat/features/profile/view/widget/add_adress_form.dart';


class ShippingAddressRepository {
  final ApiService _apiService ;
ShippingAddressRepository(this._apiService);
  Future<List<AddressModel>?> fetchAllAddresses() async {
    try {
      log("🔵 [ShippingAddressRepository] - Fetching all addresses...");

      final response = await _apiService.getRequest(
        EndPoint.baseUrl,
        EndPoint.shippingAddress,
        headers: {
          "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2N2NjMzVjN2ZlMmVkZTkzMTE5NzE4NDIiLCJpYXQiOjE3NDI2ODc3MDYsImV4cCI6MTc1MDQ2MzcwNn0.ZVI8pwLgQ8NbDgheAQHirou7ubRXzQTy0sM_TNgFRNs",
        },
      );

      if (response != null && response is Map<String, dynamic>) {
        final List<dynamic> data = response["data"] ?? [];
        log("✅ [ShippingAddressRepository] - ${data.length} addresses fetched.");
        return data.map((address) => AddressModel.fromJson(address)).toList();
      } else {
        log("❌ [ShippingAddressRepository] - Invalid response format");
        return null;
      }
    } catch (e) {
      log("❌ [ShippingAddressRepository] - Error fetching addresses: $e");
      return null;
    }
  }

  Future<bool> addAddress(AddAddressModel address) async {
    try {
      log("🔵 [ShippingAddressRepository] - Adding new address...");

      final response = await _apiService.postRequest(
        EndPoint.baseUrl,
        EndPoint.shippingAddress,
        body: address.toJson(),
        headers: {
          "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2N2NjMzVjN2ZlMmVkZTkzMTE5NzE4NDIiLCJpYXQiOjE3NDI2ODc3MDYsImV4cCI6MTc1MDQ2MzcwNn0.ZVI8pwLgQ8NbDgheAQHirou7ubRXzQTy0sM_TNgFRNs",
          "Content-Type": "application/json",
        },
      );

      if (response != null && response is Map<String, dynamic>) {
        log("✅ [ShippingAddressRepository] - Address added successfully");
        return true;
      } else {
        log("❌ [ShippingAddressRepository] - Failed to add address");
        return false;
      }
    } catch (e) {
      log("❌ [ShippingAddressRepository] - Error adding address: $e");
      return false;
    }
  }

  Future<bool> deleteAddress(String addressId) async {
    try {
      log("🔵 [ShippingAddressRepository] - Deleting address with ID: $addressId");

      final response = await _apiService.deleteRequest(
        EndPoint.baseUrl,
        "${EndPoint.shippingAddress}/$addressId",
        headers: {
          "Authorization": "Bearer YOUR_ACCESS_TOKEN",
        },
      );

      if (response != null && response["success"] == true) {
        log("✅ [ShippingAddressRepository] - Address deleted successfully");
        return true;
      } else {
        log("❌ [ShippingAddressRepository] - Failed to delete address");
        return false;
      }
    } catch (e) {
      log("❌ [ShippingAddressRepository] - Error deleting address: $e");
      return false;
    }
  }
}
