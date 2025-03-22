import 'dart:developer';
import 'package:team1_khayat/core/service/api_service.dart';
import 'package:team1_khayat/core/service/end_point.dart';
import 'package:team1_khayat/features/profile/model/review_model.dart';

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



  Future<bool> createReview(String review, int rating, String userId, String productId, String productType) async {
  try {
    final response = await _apiService.postRequest(
      EndPoint.baseUrl,
EndPoint.createNewRview,
      body:{
      "review": review,
      "ratings": rating,
      "user": userId,
      "product": productId,
      "productType": productType,
    }
    );

     if (response != null ) {
      return true;
    } else {
      log("❌ [ReviewsRepository] - فشل إنشاء المراجعة: ${response.toString()}");
      return false;
    }
  } catch (e) {
    log("❌ [ReviewsRepository] - فشل إنشاء المراجعة: ${e.toString()}");
    return false;
  }
}

}
