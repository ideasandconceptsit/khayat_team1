import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/core/network/dio_utils.dart';
import 'package:team1_khayat/features/cart/models/delivry_method_model.dart';
import 'package:team1_khayat/features/cart/models/payment_model.dart';
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
  Future<List<PaymentModel>> getPaymentMethods()async {
    //just for test
    return [
      for (int i = 0; i < 5; i++)
        PaymentModel(
            id: i.toString(),
            nameOnCard: "Name ${i + 1}",
            cardNumber: "5546 8205 3693 39$i",
            expireDate: "05/23",
            cVV: "56$i",
        )
    ];
  }
  Map<String, String> _getHeaders() {
    return {
      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2N2Q0YmViNzljZWZkZTI4YWY2MjlkZDYiLCJpYXQiOjE3NDE5OTU3MDYsImV4cCI6MTc0OTc3MTcwNn0.MfH0NI5oq5T-PS8eReIFmrKMo16LjNJhU4haiIFTrPE',
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