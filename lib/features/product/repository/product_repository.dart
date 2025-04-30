import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_constants.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/core/network/dio_utils.dart';
import 'package:team1_khayat/features/cart/models/cart_product_model.dart';
import 'package:team1_khayat/features/cart/models/updated_cart_model.dart';

class ProductRepository {
  final Dio _dio = DioUtils.getInstance();

  Future<void> addFabricToFavorites(String fabricId) async {
    try {
      final response = await _dio.post(
        'https://khayat-backend.onrender.com/api/favorite/fabrics',
        options: Options(headers: _getHeaders()),
        data: {'fabricId': fabricId},
      );

      if (response.statusCode == 200) {
        print('Fabric added to favorites successfully');
      } else {
        print('Error: ${response.statusCode} - ${response.statusMessage}');
        throw Exception();
      }
    } on DioException catch (e) {
      print('Dio Error: ${e.response?.statusCode} - ${e.message}');
      throw _exceptionFromResponse(e);
    } catch (e) {
      print('Unexpected Error: $e');
      throw Exception(AppStrings.someThingWentWrong.tr);
    }
  }

  Future<void> addAccessoryToFavorites(String accessoryId) async {
    try {
      final response = await _dio.post(
        'https://khayat-backend.onrender.com/api/favorite/accessories',
        options: Options(headers: _getHeaders()),
        data: {'accessoryId': accessoryId},
      );

      if (response.statusCode == 200) {
        print('Accessory added to favorites successfully');
      } else {
        print('Error: ${response.statusCode} - ${response.statusMessage}');
        throw Exception();
      }
    } on DioException catch (e) {
      print('Dio Error: ${e.response?.statusCode} - ${e.message}');
      throw _exceptionFromResponse(e);
    } catch (e) {
      print('Unexpected Error: $e');
      throw Exception(AppStrings.someThingWentWrong.tr);
    }
  }

  Future<UpdatedCartProductModel> addItemToCart(String productId, String productType) async {
    try {
      final response = await _dio.post(
        'https://khayat-backend.onrender.com/api/cart',
        options: Options(headers: _getHeaders()),
        data: {
          'productType': productType,
          'productId':productId,
          'quantity':1
        },
      );
      if (response.statusCode == 200) {
        print('Item added to cart successfully');
        return UpdatedCartProductModel.fromJson(response.data['data']);
      } else {
        print('Error: ${response.statusCode} - ${response.statusMessage}');
        throw Exception();
      }
    } on DioException catch (e) {
      print('Dio Error: ${e.response?.statusCode} - ${e.message}');
      throw _exceptionFromResponse(e);
    } catch (e) {
      print('Unexpected Error: $e');
      throw Exception(AppStrings.someThingWentWrong.tr);
    }
  }

  Exception _exceptionFromResponse(DioException e) {
    if (e.response != null) {
      return Exception(e.response!.data['message']);
    } else {
      return Exception(AppStrings.someThingWentWrong.tr);
    }
  }

  Map<String, String> _getHeaders() {
    return {
      'Authorization':
          'Bearer ${AppConstants.token}',
    };
  }
}
