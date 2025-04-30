import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_constants.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/core/network/dio_utils.dart';
import 'package:team1_khayat/features/cart/models/add_card_model.dart';
import 'package:team1_khayat/features/cart/models/payment_card_model.dart';

class PaymentRepository {
  final Dio _dio = DioUtils.getInstance();

  Future<List<PaymentCardModel>> getPaymentCards() async {
    try {
      final response = await _dio.get(
        'https://khayat-backend.onrender.com/api/card',
        options: Options(headers: _getHeaders()),
      );

      if (response.statusCode == 200) {
        print(jsonEncode(response.data));
        return (response.data['data'] as List)
            .map((e) => PaymentCardModel.fromJson(e))
            .toList();
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

  Future<PaymentCardModel> addPaymentCard(AddCardModel addCardModel) async {
    try {
      final response = await _dio.post(
        'https://khayat-backend.onrender.com/api/card',
        options: Options(headers: _getHeaders()),
        data: addCardModel.toJson(),
      );

      if (response.statusCode == 201) {
        print(jsonEncode(response.data));
        return PaymentCardModel.fromJson(response.data['data']);
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
      'Authorization':
          'Bearer ${AppConstants.token  }',
    };
  }

  Exception _exceptionFromResponse(DioException e) {
    if (e.response != null) {
      return Exception(e.response!.data['message']);
    } else {
      return Exception(AppStrings.someThingWentWrong.tr);
    }
  }
}
