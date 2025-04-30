import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_constants.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/core/network/dio_utils.dart';
import 'package:team1_khayat/features/cart/models/delivry_method_model.dart';
import 'package:team1_khayat/features/cart/models/shipping_address_model.dart';

class CheckoutRepository{
  final Dio _dio = DioUtils.getInstance();

  Future<List<ShippingAddressModel>> getShippingAddresses()async {
    try {
      final response = await _dio.get(
        'https://khayat-backend.onrender.com/api/address',
        options: Options(headers: _getHeaders()),
      );

      if (response.statusCode == 200) {
        print(jsonEncode(response.data));
        return (response.data['data'] as List).map((e) => ShippingAddressModel.fromJson(e)).toList();
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

  Future<List<DeliveryMethodModel>> getDeliveryMethods()async {
    try {
      final response = await _dio.get(
        'https://khayat-backend.onrender.com/api/delivery',
        options: Options(headers: _getHeaders()),
      );

      if (response.statusCode == 200) {
        print(jsonEncode(response.data));
        return (response.data['data'] as List).map((e) => DeliveryMethodModel.fromJson(e)).toList();
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
  Map<String, String> _getHeaders() {
    return {
      'Authorization': 'Bearer ${AppConstants.token}',
    };
  }
  Exception _exceptionFromResponse(DioException e) {
    if(e.response != null) {
      return Exception(e.response!.data['message']);
    }
    else {
      return Exception(AppStrings.someThingWentWrong.tr);
    }
  }
}