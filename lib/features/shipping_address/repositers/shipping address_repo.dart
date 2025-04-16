import '../../../core/services/api_service.dart';
import '../models/shipping_address_model.dart';

class ShippingAddressRepo {
  final ApiService _apiService = ApiService();

  Future<List<ShippingAddressModel>> getAllAddresses() async {
    try {
      final response = await _apiService.get('address');
      print('Raw API response for getAllAddresses: $response');

      if (response == null) {
        print('Warning: Null response from getAllAddresses API');
        return [];
      }

      if (response['data'] == null) {
        print('Warning: No data field in getAllAddresses response');
        return [];
      }

      return (response['data'] as List)
          .map((e) => ShippingAddressModel.fromJson(e))
          .toList();
    } catch (e) {
      print('Error in getAllAddresses: $e');
      return [];
    }
  }

  Future<ShippingAddressModel> createAddress(
      ShippingAddressModel address) async {
    try {
      final response = await _apiService.post('/api/address', address.toJson());
      print('API Response for createAddress: $response');

      if (response == null) {
        print('Warning: Null response from createAddress API');
        return address; // Return original as fallback
      }

      // Handle both direct response and response.data pattern
      final addressData = response['data'] ?? response;
      return ShippingAddressModel.fromJson(addressData);
    } catch (e) {
      print('Error in createAddress: $e');
      return address; // Return original as fallback
    }
  }

  Future<ShippingAddressModel> updateAddress(
      String id, ShippingAddressModel address) async {
    final response = await _apiService.put('address/$id', address.toJson());
    return ShippingAddressModel.fromJson(response);
  }

  Future<void> deleteAddress(String id) async {
    try {
      // Using the same pattern as your other methods
      await _apiService.delete('address/$id');
      // No need to parse response if the API returns no content
    } catch (e) {
      print('Repository deleteAddress error: $e');
      throw Exception('Failed to delete address: $e');
    }
  }
}
