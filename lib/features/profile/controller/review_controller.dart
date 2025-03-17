import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/features/profile/model/review_model.dart';
import 'package:team1_khayat/features/profile/repos/review_repository.dart';
import 'package:team1_khayat/shared/app_snakbar/app_snackbar.dart';

class ReviewsController extends GetxController {
  final ReviewsRepository _reviewsRepository;

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
    fetchReviews();
  }

  Future<void> fetchReviews() async {
    try {
      isLoading.value = true;
      final fetchedReviews = await _reviewsRepository.fetchReviews();

      if (fetchedReviews != null && fetchedReviews.isNotEmpty) {
        reviews.assignAll(fetchedReviews);
        log("✅ [ReviewsController] - Loaded ${reviews.length} reviews");

        SnackbarHelper.showSuccessSnackbar("تم تحميل المراجعات بنجاح");
      } else {
        log("❌ [ReviewsController] - فشل تحميل المراجعات");
        SnackbarHelper.showErrorSnackbar("لم يتم العثور على مراجعات.");
      }
    } catch (e) {
      SnackbarHelper.showErrorSnackbar("حدث خطأ أثناء تحميل المراجعات: ${e.toString()}");
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

  // دالة لتفريغ الحقول بعد الإرسال
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
