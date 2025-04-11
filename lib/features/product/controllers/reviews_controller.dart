import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/features/product/models/add_review_paramter.dart';
import 'package:team1_khayat/features/product/models/base_product_model.dart';
import 'package:team1_khayat/features/product/models/review_model.dart';
import 'package:team1_khayat/features/product/repository/reviews_repository.dart';
import 'package:team1_khayat/shared/app_snakbar/app_snackbar.dart';
import 'package:team1_khayat/state_managment/app_status.dart';

class ReviewsController extends GetxController {
  final BaseProductModel product;
  var addReviewState = AppState.idle.obs;
  var getReviewsState = AppState.idle.obs;
  late TextEditingController reviewTextController;
  RxList<ReviewModel> reviews = <ReviewModel>[].obs;

  Rx<int> rating = 0.obs;



  final ReviewsRepository reviewsRepository = ReviewsRepository();

  ReviewsController({required this.product});


  void addReviewToProduct() async {
    if(reviewTextController.text.isEmpty) {
      showErrorSnackBar(AppStrings.pleaseEnterReview.tr);
      return;
    }
    else if(rating.value == 0) {
      showErrorSnackBar(AppStrings.pleaseSelectRating.tr);
      return;
    }
    try {
      addReviewState.value = AppState.loading;
      //todo: must change with user id
      AddReviewParamter addReviewParam = AddReviewParamter(review: reviewTextController.text, rating: rating.value, productId: product.id, user: "67cc35c7fe2ede9311971842", productType: product is FabricProductModel ? "Fabric" : "Accessory");
      ReviewModel review=await reviewsRepository.addReviewToProduct(addReviewParam);
      reviews.add(review);
      addReviewState.value = AppState.success;
      Get.back();
      rating.value = 0;
      reviewTextController.value = TextEditingValue.empty;
      showSuccessSnackBar(AppStrings.reviewAddedSuccessfully.tr);

    } catch (e) {
      showErrorSnackBar(e.toString());
      addReviewState.value = AppState.error;
    }
  }

  void getReviews() async {
    try {
      getReviewsState.value = AppState.loading;
      reviews.assignAll((await reviewsRepository.getReviewsForProduct(product.id, product is FabricProductModel ? "fabric" : "accessory")));
      getReviewsState.value = AppState.success;
    } catch (e) {
      getReviewsState.value = AppState.error;
    }
  }

  void changeRating(int value) {
    rating.value = value;
  }

  @override
  void onInit() {
    reviewTextController = TextEditingController();
    getReviews();
    super.onInit();
  }

}
