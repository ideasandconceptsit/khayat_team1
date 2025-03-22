import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:team1_khayat/features/profile/model/review_model.dart';
import 'package:team1_khayat/features/profile/repos/review_repository.dart';
import 'package:team1_khayat/shared/app_snakbar/app_snackbar.dart';

class ReviewsController extends GetxController {
  final ReviewsRepository _reviewsRepository;
  final box = GetStorage(); 

  ReviewsController(this._reviewsRepository);

  var reviews = <ReviewModel>[].obs;
    final TextEditingController reviewController = TextEditingController();
  final TextEditingController ratingController = TextEditingController();
  final TextEditingController userIdController = TextEditingController();
  final TextEditingController productIdController = TextEditingController();
  final TextEditingController productTypeController = TextEditingController();
  RxBool isLoading = false.obs;
  var selectedRating = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserReviews();
  }

 Future<void> fetchUserReviews() async {
  try {
    isLoading.value = true;

    // ✅ استرجاع userId من GetStorage
    final String? userId = box.read('userId');

    if (userId == null || userId.isEmpty) {
      log("❌ [ReviewsController] - User ID not found");
      SnackbarHelper.showErrorSnackbar("تعذر العثور على بيانات المستخدم.");
      return;
    }

    // ✅ جلب جميع المراجعات
    final allReviews = await _reviewsRepository.fetchReviews();

    if (allReviews != null && allReviews.isNotEmpty) {
      // ✅ تصفية المراجعات الخاصة بالمستخدم
      final userReviews = allReviews.where((review) => review.user.id == userId).toList();

      if (userReviews.isNotEmpty) {
        reviews.assignAll(userReviews);
        log("✅ [ReviewsController] - Loaded ${reviews.length} reviews for user $userId");
      } else {
        log("❌ [ReviewsController] - No reviews found for user $userId");
        SnackbarHelper.showErrorSnackbar("لم يتم العثور على مراجعات.");
      }
    } else {
      log("❌ [ReviewsController] - Failed to load reviews");
      SnackbarHelper.showErrorSnackbar("تعذر تحميل المراجعات.");
    }
  } catch (e) {
    log("❌ [ReviewsController] - Error fetching user reviews: $e");
    SnackbarHelper.showErrorSnackbar("حدث خطأ أثناء تحميل المراجعات.");
  } finally {
    isLoading.value = false;
  }
}


    Future<bool> addReview({
    required String userId,
    required String productId,
    required String productType,
  }) async {
    try {
      isLoading.value = true;

      bool success = await _reviewsRepository.createReview(
        reviewController.text,
        selectedRating.value,
        userId,
        productId,
        productType,
      );

      isLoading.value = false;

      if (success) {
        clearFields(); // تفريغ الحقول بعد الإرسال الناجح
      }
      return success;
    } catch (e) {
      isLoading.value = false;
      log("❌ [ReviewsController] - خطأ أثناء إضافة المراجعة: ${e.toString()}");
      return false;
    }
  }

  void clearFields() {
    reviewController.clear();
    selectedRating.value = 0;
  }

  @override
  void onClose() {
    reviewController.dispose();
    super.onClose();
  }

}
