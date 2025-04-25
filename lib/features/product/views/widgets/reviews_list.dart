import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/features/cart/views/cart/widgets/custom_error_widget.dart';
import 'package:team1_khayat/features/product/controllers/reviews_controller.dart';
import 'package:team1_khayat/features/product/models/review_model.dart';
import 'package:team1_khayat/features/product/views/widgets/review_card.dart';
import 'package:team1_khayat/state_managment/app_status.dart';

class ReviewsList extends StatelessWidget {
  ReviewsList({
    super.key,
  });

  final ReviewsController reviewsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => reviewsController.getReviewsState.value == AppState.loading
          ? const ReviewsListSkeleton()
          : reviewsController.getReviewsState.value == AppState.error?
      CustomErrorWidget(title: AppStrings.someThingWentWrong.tr,retryFunction: reviewsController.getReviews,)
          :ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ReviewCard(
                  reviewModel: reviewsController.reviews[index],
                );
              },
              separatorBuilder: (context, index) => SizedBox(
                    height: 10.h,
                  ),
              itemCount: reviewsController.reviews.length),
    );
  }
}

class ReviewsListSkeleton extends StatelessWidget {
  const ReviewsListSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Skeletonizer(
            enabled: true,
            child: ReviewCard(
              reviewModel: _getReviewModel(),
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(
          height: 10.h,
        ),
        itemCount: 10);
  }

  ReviewModel _getReviewModel() {
    return ReviewModel(
      id: '',
      review: '',
      ratings: 0,
      user: User(id: '', name: ''),
      product: '',
      productType: '',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }
}

