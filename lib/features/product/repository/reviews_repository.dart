import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/core/network/dio_utils.dart';
import 'package:team1_khayat/features/product/models/add_review_paramter.dart';
import 'package:team1_khayat/features/product/models/review_model.dart';

class ReviewsRepository {
  final Dio _dio = DioUtils.getInstance();

  Future<ReviewModel> addReviewToProduct(
      AddReviewParamter addReviewParam) async {
    try {
      log(addReviewParam.toJson().toString());
      final response = await _dio.post(
        'https://khayat-backend.onrender.com/api/review',
        options: Options(headers: _getHeaders()),
        data: addReviewParam.toJson(),
      );

      if (response.statusCode == 201) {
        ReviewModel reviewModel = ReviewModel(
          createdAt: DateTime.parse(response.data['data']['createdAt']),
          updatedAt: DateTime.parse(response.data['data']['updatedAt']),
          id: response.data['data']['_id'],
            product: addReviewParam.productId,
            productType: addReviewParam.productType,
            review: addReviewParam.review,
            ratings: addReviewParam.rating,
            //todo must replace with user name
            user:User(id: addReviewParam.user, name: "My Name") );
        return reviewModel;
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

  Future<List<ReviewModel>> getReviewsForProduct(
      String productId, String productType) async {
    try {
      final response = await _dio.get(
        'https://khayat-backend.onrender.com/api/${productType.toLowerCase()}/$productId/reviews',
        options: Options(headers: _getHeaders()),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'];
        List<ReviewModel> reviews = data.map((json) => ReviewModel.fromJson(json)).toList();
        return reviews;
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
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2N2Q0YmViNzljZWZkZTI4YWY2MjlkZDYiLCJpYXQiOjE3NDE5OTU3MDYsImV4cCI6MTc0OTc3MTcwNn0.MfH0NI5oq5T-PS8eReIFmrKMo16LjNJhU4haiIFTrPE',
    };
  }
}
