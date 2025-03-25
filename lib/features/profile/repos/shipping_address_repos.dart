import 'dart:developer';
import 'package:team1_khayat/core/service/api_service.dart';
import 'package:team1_khayat/core/service/end_point.dart';
import 'package:team1_khayat/features/profile/model/address_model.dart';

class ShippingAddressRepository {
  final ApiService _apiService;

  ShippingAddressRepository(this._apiService);

  Future<List<AddressModel>?> fetchAllAddresses() async {
    try {
      log("🔵 [ShippingAddressRepository] - Fetching all addresses...");

      final response = await _apiService.getRequest(
        EndPoint.baseUrl,
        EndPoint.shippingAddress,
        headers: {
          "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2N2NjMzVjN2ZlMmVkZTkzMTE5NzE4NDIiLCJpYXQiOjE3NDI2ODc3MDYsImV4cCI6MTc1MDQ2MzcwNn0.ZVI8pwLgQ8NbDgheAQHirou7ubRXzQTy0sM_TNgFRNs",
        }
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
}
