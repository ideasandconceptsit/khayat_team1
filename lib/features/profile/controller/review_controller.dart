import 'dart:developer';
import 'package:get/get.dart';
import 'package:team1_khayat/features/profile/model/review_model.dart';
import 'package:team1_khayat/features/profile/repos/review_repository.dart';
import 'package:team1_khayat/shared/app_snakbar/app_snackbar.dart';

class ReviewsController extends GetxController {
  final ReviewsRepository _reviewsRepository;

  ReviewsController(this._reviewsRepository);

  RxList<ReviewModel> reviews = <ReviewModel>[].obs;
  
  RxBool isLoading = false.obs;

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


 

}
