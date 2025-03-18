import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/core/service/api_service.dart';
import 'package:team1_khayat/features/profile/controller/review_controller.dart';
import 'package:team1_khayat/features/profile/repos/review_repository.dart';
import 'package:team1_khayat/features/profile/view/widget/create_new_review_buttom_sheet.dart';
import 'package:team1_khayat/features/profile/view/widget/review_item.dart';
import 'package:team1_khayat/features/profile/view/widget/review_summary.dart';
import 'package:team1_khayat/shared/app_bottom_sheet/app_bottom_sheet.dart';
import 'package:team1_khayat/shared/custom_app_bar/custom_app_bar.dart';
import 'package:team1_khayat/shared/navigation_service.dart';
import 'package:team1_khayat/shared/shimmer/redacted_effect.dart';

class ReviewAndRatingScreen extends StatelessWidget {
  const ReviewAndRatingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final reviewController = Get.put(ReviewsController(ReviewsRepository(ApiService())));

    return Scaffold(
      appBar: CustomAppBar(
        arrowBackVisibility: true,
        arrowBackOnPressed: () => NavigationService.navigateBack(),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: Text("Rating & Reviews", style: AppTextStyles.tajawaltextStyle34),
              ),
            ), 
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Obx(() {
                  return reviewController.isLoading.value 
                      ? const LoadingTextEffect()
                      : ReviewSummary();
                }),
              ),
            ),
             SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Obx(() {
                  return reviewController.isLoading.value 
                      ? const LoadingTextEffect()
                      : Text('review ${reviewController.reviews.length.toString()}',
                      style: AppTextStyles.tajawaltextStyle24,
                      );
                }),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height:20.h ,),
            ),
            Obx(() {
              return reviewController.isLoading.value
                  ? const SliverToBoxAdapter(child: LoadingShimmerEffect())
                  : SliverPadding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            final review = reviewController.reviews[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ReviewItem(review: review),
                            );
                          },
                          childCount: reviewController.reviews.length,
                        ),
                      ),
                    );
            }),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    onPressed: () {
                      showCustomAppBottomSheet(
                        context,
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: CreateNewReviewBottomSheet(
                          productId: "",
                          productType: "Fabric",
                          userId: "67c3b6e5e2e27877cd10d42b",
                        ),
                      );
                    },
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.edit, color: Colors.white),
                        SizedBox(width: 8),
                        Text("Write a review", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
