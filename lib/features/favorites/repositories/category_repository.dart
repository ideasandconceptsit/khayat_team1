import 'package:get/get.dart';
import '../../../core/services/api_service.dart';
import '../models/category_model.dart';

class FavoriteCategoryRepository {
  final ApiService _apiService = Get.find<ApiService>();

  // Get all categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final response = await _apiService.get('categories');
      final data = response['data'] as List<dynamic>;
      return data.map((json) => CategoryModel.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }

  // Get category by ID
  Future<CategoryModel> getCategoryById(String id) async {
    try {
      final response = await _apiService.get('categories/$id');
      return CategoryModel.fromJson(response['data']);
    } catch (e) {
      rethrow;
    }
  }

  // Create new category
  Future<CategoryModel> createCategory(Map<String, dynamic> data) async {
    try {
      final response = await _apiService.post('categories', data);
      return CategoryModel.fromJson(response['data']);
    } catch (e) {
      rethrow;
    }
  }

  // Update category
  Future<CategoryModel> updateCategory(
      String id, Map<String, dynamic> data) async {
    try {
      final response = await _apiService.put('categories/$id', data);
      return CategoryModel.fromJson(response['data']);
    } catch (e) {
      rethrow;
    }
  }

  // Delete category
  Future<bool> deleteCategory(String id) async {
    try {
      await _apiService.delete('categories/$id');
      return true;
    } catch (e) {
      rethrow;
    }
  }
}
