// favorite_repository.dart
import 'package:get/get.dart';

import '../../../core/services/api_service.dart';
import '../../Catalog2/models/product_model.dart';
import '../models/favorite_model.dart';

class FavoriteRepository {
  final ApiService _apiService;

  // Only initialize in constructor
  FavoriteRepository({required ApiService apiService})
      : _apiService = apiService;
  Future<FavoriteResponse> getFavoriteAccessories() async {
    try {
      print('Fetching favorite accessories...');
      final response = await _apiService.get('favorite/accessories');
      print('Accessories response: $response');
      return FavoriteResponse.fromJson(response);
    } catch (e) {
      print('Error in getFavoriteAccessories: $e');
      rethrow;
    }
  }

  Future<FavoriteResponse> getFavoriteFabrics() async {
    try {
      print('Fetching favorite fabrics...');
      final response = await _apiService.get('favorite/fabrics');

      print('Fabrics response: $response');
      return FavoriteResponse.fromJson(response);
    } catch (e) {
      print('Error in getFavoriteFabrics: $e');
      rethrow;
    }
  }

  Future<FavoriteOperationResponse> addAccessoryToFavorites(
      String accessoryId) async {
    try {
      final response = await _apiService
          .post('favorite/accessories', {'accessoryId': accessoryId});
      print('Add accessory response: $response');
      return FavoriteOperationResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<FavoriteOperationResponse> addFabricToFavorites(
      String fabricId) async {
    try {
      final response =
          await _apiService.post('/api/favorite/fabrics', {'fabricId': fabricId});
      return FavoriteOperationResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<FavoriteOperationResponse> addToFavorites(
      String productId, ProductType type) async {
    try {
      if (type == ProductType.fabric) {
        return await addFabricToFavorites(productId);
      } else {
        return await addAccessoryToFavorites(productId);
      }
    } catch (e) {
      print('Error adding to favorites: $e');
      rethrow;
    }
  }

  Future<FavoriteOperationResponse> removeAccessoryFromFavorites(
      String accessoryId) async {
    try {
      final response =
          await _apiService.delete('favorite/accessories/$accessoryId');
      return FavoriteOperationResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<FavoriteOperationResponse> removeFabricFromFavorites(
      String fabricId) async {
    try {
      final response = await _apiService.delete('favorite/fabrics/$fabricId');
      return FavoriteOperationResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<FavoriteOperationResponse> removeFromFavorites(
      String productId, ProductType type) async {
    return await removeFavorite(productId, type);
  }

  Future<FavoriteOperationResponse> removeFavorite(
      String productId, ProductType type) async {
    try {
      final endpoint = type == ProductType.fabric
          ? 'favorite/fabrics/$productId'
          : 'favorite/accessories/$productId';

      final response = await _apiService.delete(endpoint);

      print('Delete response: $response');

      if (response == null || response['status'] != 'success') {
        throw Exception('Failed to remove favorite');
      }

      return FavoriteOperationResponse.fromJson(response);
    } catch (e) {
      print('Error removing favorite: $e');
      rethrow;
    }
  }
}
