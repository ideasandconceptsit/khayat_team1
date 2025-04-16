import 'dart:convert';
import 'dart:developer';
import 'package:team1_khayat/core/services/api_service.dart';
import 'package:team1_khayat/core/services/end_point.dart';
import 'package:team1_khayat/features/profile/model/review_model.dart';
import 'package:http/http.dart' as http;
class ReviewsRepository {
  final ApiService _apiService;

  ReviewsRepository(this._apiService);

  Future<List<ReviewModel>?> fetchReviews() async {
  try {
    log("🔵 [ReviewsRepository] - Fetching all reviews...");
    
     final response = await _apiService.getRequest(
      EndPoint.baseUrl,
      EndPoint.getAllReview,
    );

    if (response != null && response is Map<String, dynamic>) {
      final List<dynamic> data = response["data"] ?? [];
      return data.map((review) => ReviewModel.fromJson(review)).toList();
    } else {
      log("❌ [ReviewsRepository] - Invalid response format");
      return null;
    }
  } catch (e) {
    log("❌ [ReviewsRepository] - Error fetching reviews: $e");
    return null;
  }
}



  Future<bool> createReview({
    required String review,
    required int rating,
    required String userId,
    required String productId,
    required String productType,
  }) async {
    try {
      final String url = "https://khayat-backend.onrender.com/api/review";
      log("🔗 [Request URL] - $url");

      final Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization":
            "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2N2MzYjZlNWUyZTI3ODc3Y2QxMGQ0MmIiLCJpYXQiOjE3NDI5OTI2ODYsImV4cCI6MTc1MDc2ODY4Nn0.hWwBk8wBGbN7ruopNaKXc-aO6ZOEpDhs4WFkx4qPx0c",
      };

      final Map<String, dynamic> body = {
        "review": review,
        "ratings": rating,
        "user": userId,
        "product": productId,
        "productType": productType,
      };
      log("📤 [Request Body] - ${jsonEncode(body)}");

      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(body),
      );

      log("🟡 [Response Status Code] - ${response.statusCode}");

      log("📥 [Response Body] - ${response.body}");

      if (response.statusCode == 201) {
        log("✅ [ReviewsRepository] - تمت إضافة المراجعة بنجاح");
        return true;
      } else {
        log("❌ [ReviewsRepository] - فشل إنشاء المراجعة: ${response.body}");
        return false;
      }
    } catch (e) {
      log("❌ [ReviewsRepository] - فشل إنشاء المراجعة: ${e.toString()}");
      return false;
    }
  }


}
