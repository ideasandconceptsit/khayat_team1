import 'package:get/get.dart';
import '../../../core/services/api_service.dart';
import '../models/product_model.dart';

class ProductRepository {
  final ApiService _apiService = Get.find<ApiService>();

  // Get all products with optional filtering
  Future<List<ProductModel>> getAllProducts({
    int page = 1,
    int limit = 10,
    String? categoryId,
    ProductType? type,
  }) async {
    try {
      // If no specific type is requested, fetch both fabrics and accessories
      if (type == null) {
        final fabrics =
            await _getProductsByType('fabric', page, limit, categoryId);
        final accessories =
            await _getProductsByType('accessory', page, limit, categoryId);
        return [...fabrics, ...accessories];
      }

      // If specific type is requested, fetch only that type
      final typeString = type == ProductType.fabric ? 'fabric' : 'accessory';
      return await _getProductsByType(typeString, page, limit, categoryId);
    } catch (e) {
      throw Exception('Failed to fetch products: ${e.toString()}');
    }
  }

  // Helper method to fetch products by type
  Future<List<ProductModel>> _getProductsByType(
    String type,
    int page,
    int limit,
    String? categoryId,
  ) async {
    try {
      String endpoint = '$type?page=$page&limit=$limit';

      if (categoryId != null) {
        endpoint += '&category=$categoryId';
      }

      final response = await _apiService.get(endpoint);
      final data = response['data'] as List<dynamic>;
      return data.map((json) => ProductModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch $type products: ${e.toString()}');
    }
  }

  // Get product by ID
  Future<ProductModel> getProductById(String id) async {
    try {
      // First check product type
      final response = await _apiService.get('products/$id');
      final productData = response['data'];
      final type = productData['type'] == 'fabric' ? 'fabric' : 'accessory';

      // Fetch product from correct endpoint
      final productResponse = await _apiService.get('$type/$id');
      return ProductModel.fromJson(productResponse['data']);
    } catch (e) {
      throw Exception('Failed to fetch product: ${e.toString()}');
    }
  }

  // Create new product
  Future<ProductModel> createProduct(Map<String, dynamic> data) async {
    try {
      final endpoint = data['type'] == 'fabric' ? 'fabric' : 'accessory';
      final response = await _apiService.post(endpoint, data);
      return ProductModel.fromJson(response['data']);
    } catch (e) {
      throw Exception('Failed to create product: ${e.toString()}');
    }
  }

  // Update existing product
  Future<ProductModel> updateProduct(
      String id, Map<String, dynamic> data) async {
    try {
      final product = await getProductById(id);
      final endpoint =
          product.type == ProductType.fabric ? 'fabric' : 'accessory';

      final response = await _apiService.put('$endpoint/$id', data);
      return ProductModel.fromJson(response['data']);
    } catch (e) {
      throw Exception('Failed to update product: ${e.toString()}');
    }
  }

  // Delete product
  Future<bool> deleteProduct(String id) async {
    try {
      final product = await getProductById(id);
      final endpoint =
          product.type == ProductType.fabric ? 'fabric' : 'accessory';

      await _apiService.delete('$endpoint/$id');
      return true;
    } catch (e) {
      throw Exception('Failed to delete product: ${e.toString()}');
    }
  }
}
