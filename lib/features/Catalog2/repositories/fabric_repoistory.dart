import 'package:get/get.dart';
import '../../../core/services/api_service.dart';
import '../models/fabric_model.dart';

class FabricRepository {
  final ApiService _apiService = Get.find<ApiService>();

  // Get all fabrics
  Future<List<FabricModel>> getAllFabrics(
      {int page = 1, int limit = 10}) async {
    try {
      final response = await _apiService.get('fabric?page=$page&limit=$limit');
      final data = response['data'] as List<dynamic>;
      return data.map((json) => FabricModel.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }

  // Get fabric by ID
  Future<FabricModel> getFabricById(String id) async {
    try {
      final response = await _apiService.get('fabric/$id');
      return FabricModel.fromJson(response['data']);
    } catch (e) {
      rethrow;
    }
  }

  // Get fabrics by category
  Future<List<FabricModel>> getFabricsByCategory(String categoryId,
      {int page = 1, int limit = 10}) async {
    try {
      final response = await _apiService
          .get('fabric?category=$categoryId&page=$page&limit=$limit');
      final data = response['data'] as List<dynamic>;
      return data.map((json) => FabricModel.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }

  // Create new fabric
  Future<FabricModel> createFabric(Map<String, dynamic> data) async {
    try {
      final response = await _apiService.post('fabric', data);
      return FabricModel.fromJson(response['data']);
    } catch (e) {
      rethrow;
    }
  }

  // Update fabric
  Future<FabricModel> updateFabric(String id, Map<String, dynamic> data) async {
    try {
      final response = await _apiService.put('fabric/$id', data);
      return FabricModel.fromJson(response['data']);
    } catch (e) {
      rethrow;
    }
  }

  // Delete fabric
  Future<bool> deleteFabric(String id) async {
    try {
      await _apiService.delete('fabric/$id');
      return true;
    } catch (e) {
      rethrow;
    }
  }

  // Update fabric quantity
  Future<FabricModel> updateFabricQuantity(String id, int quantity) async {
    try {
      final response =
          await _apiService.put('fabric/$id/quantity', {'quantity': quantity});
      return FabricModel.fromJson(response['data']);
    } catch (e) {
      rethrow;
    }
  }
}
