import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/core/network/dio_utils.dart';
import 'package:team1_khayat/features/cart/models/cart_product_model.dart';
import 'package:team1_khayat/features/cart/models/promo_code_model.dart';
import 'package:team1_khayat/features/cart/models/updated_cart_model.dart';

class CartRepository {
  final Dio _dio = DioUtils.getInstance();


  Future<CartProductModel> getCartProducts()async {
    try {
      final response = await _dio.get(
        'https://khayat-backend.onrender.com/api/cart/',
        options: Options(headers: _getHeaders()),

      );
      if (response.statusCode == 200) {
        log(jsonEncode(response.data));
        log(jsonEncode(response.data['data']['items']));

        return CartProductModel.fromJson(response.data['data']);

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
  Future<List<PromoCodeModel>> getPromoCodes()async {

    try {
      final response = await _dio.get(
        'https://khayat-backend.onrender.com/api/coupons/active',
        options: Options(headers: _getHeaders()),

      );
      if (response.statusCode == 200) {

        print(jsonEncode(response.data));
        List<PromoCodeModel> promoCodes=[];
        response.data['data'].forEach((element) {
          promoCodes.add(PromoCodeModel.fromJson(element));
        });
        return promoCodes;

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
    if(e.response != null) {
      return Exception(e.response!.data['message']);
    }
    else {
      return Exception(AppStrings.someThingWentWrong.tr);
    }
  }
  Future<UpdatedCartProductModel> updateCartProduct(String cartItemId, int quantity) async {

    try {
      final response = await _dio.put(
        'https://khayat-backend.onrender.com/api/cart/$cartItemId',
        options: Options(headers: _getHeaders()),
        data: {'quantity': quantity},
      );

      if (response.statusCode == 200) {
        print(jsonEncode(response.data));
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
  Future<UpdatedCartProductModel> applyCoupon(String couponCode) async {
    try {
      final response = await _dio.put(
        'https://khayat-backend.onrender.com/api/cart/apply-coupon',
        options: Options(headers: _getHeaders()),
        data: {'couponCode': couponCode},
      );

      if (response.statusCode == 200) {
        print(jsonEncode(response.data));
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
  Future<UpdatedCartProductModel> removeItemFromCart(String cartItemId) async {
    try {
      final response = await _dio.delete(
        'https://khayat-backend.onrender.com/api/cart/$cartItemId',
        options: Options(headers: _getHeaders()),
      );

      if (response.statusCode == 200) {
        print('Item removed successfully');
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

  Future<void> removeFabricFromFavorites(String fabricId) async {
    try {
      final response = await _dio.delete(
        'https://khayat-backend.onrender.com/api/favorite/fabrics/$fabricId',
        options: Options(headers: _getHeaders()),
      );

      if (response.statusCode == 200) {
        print('Fabric removed from favorites successfully');
      } else {
        print('Error: ${response.statusCode} - ${response.statusMessage}');
        throw Exception();
      }
    } on DioException catch (e) {
      print('Dio Error: ${e.response?.statusCode} - ${e.message}');
      _exceptionFromResponse(e);
    } catch (e) {
      print('Unexpected Error: $e');
      throw Exception(AppStrings.someThingWentWrong.tr);
    }
  }
  Future<void> removeAccessoryFromFavorites(String accessoryId) async {
    try {
      final response = await _dio.delete(
        'https://khayat-backend.onrender.com/api/favorite/accessories/$accessoryId',
        options: Options(headers: _getHeaders()),
      );

      if (response.statusCode == 200) {
        print('Accessory removed from favorites successfully');
      } else {
        print('Error: ${response.statusCode} - ${response.statusMessage}');
        throw Exception();
      }
    } on DioException catch (e) {
      print('Dio Error: ${e.response?.statusCode} - ${e.message}');
      _exceptionFromResponse(e);
    } catch (e) {
      print('Unexpected Error: $e');
      throw Exception(AppStrings.someThingWentWrong.tr);
    }
  }


  Map<String, String> _getHeaders() {
    return {
      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2Nzk2Nzg2Nzg3MmJmZTMyNWE0ZGY0NmYiLCJpYXQiOjE3NDA1NzI4MTcsImV4cCI6MTc0ODM0ODgxN30.qBwgO1xjYWbIXkdMvMCgF9wzvRw82InP17E4eNrWlsI',
    };
  }
}
