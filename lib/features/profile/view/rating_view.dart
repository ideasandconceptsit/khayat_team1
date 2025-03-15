import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_assets.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/core/service/api_service.dart';
import 'package:team1_khayat/features/profile/controller/review_controller.dart';
import 'package:team1_khayat/features/profile/model/review_model.dart';
import 'package:team1_khayat/features/profile/repos/review_repository.dart';
import 'package:team1_khayat/features/profile/view/widget/build_loading_order_list.dart';
import 'package:team1_khayat/features/profile/view/widget/create_new_review_buttom_sheet.dart';
import 'package:team1_khayat/features/profile/view/widget/custom_circle_avatar.dart';
import 'package:team1_khayat/shared/app_bottom_sheet/app_bottom_sheet.dart';
import 'package:team1_khayat/shared/custom_app_bar/custom_app_bar.dart';
import 'package:team1_khayat/shared/navigation_service.dart';

class ReviewAndRatingScreen extends StatefulWidget {
  const ReviewAndRatingScreen({super.key});

  @override
  State<ReviewAndRatingScreen> createState() => _ReviewAndRatingScreenState();
}

class _ReviewAndRatingScreenState extends State<ReviewAndRatingScreen> {
  final _reviewController = Get.put(ReviewsController(ReviewsRepository(ApiService())));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        arrowBackVisibility: true,
        arrowBackOnPressed: () {
          NavigationService.navigateBack();
        },
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text("Rating & Reviews", style: AppTextStyles.tajawaltextStyle34),
              ),
            ),
            // SliverToBoxAdapter(
            //   child: Padding(
            //     padding: const EdgeInsets.all(16.0),
            //     child: Obx(() => _buildRatingBar()),
            //   ),
            // ),
            Obx(() {
              if (_reviewController.isLoading.value) {
                return const SliverFillRemaining(
                  child: LoadingOrderList(),
                );
              } else if (_reviewController.reviews.isEmpty) {
                return const SliverFillRemaining(
                  child: Center(child: Text("لا توجد مراجعات حتى الآن")),
                );
              } else {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final review = _reviewController.reviews[index];
                      return _buildReviewItem(review);
                    },
                    childCount: _reviewController.reviews.length,
                  ),
                );
              }
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
                    showCustomAppBottomSheet(context ,
               height: MediaQuery.of(context).size.height *0.7,
              child:  CreateNewReviewBottomSheet(
            ),);
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

 


  Widget _buildReviewItem(ReviewModel review) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomCircleAvatar(path: AppAssets.imagetest, size: 40),
                  SizedBox(width: 8.h),
                  Text(review.user.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                  const Spacer(),
                  Text(review.createdAt.toString().split(' ')[0], style: const TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
              SizedBox(height: 8.h),
              Text(review.review, style: AppTextStyles.tajawaltextStyle14),
              Row(
                children: List.generate(
                  review.ratings,
                  (index) => const Icon(Icons.star, color: Colors.amber, size: 20),
                )..addAll(
                    List.generate(5 - review.ratings, (index) => const Icon(Icons.star, color: Colors.grey, size: 20)),
                  ),
              ),
              SizedBox(height: 8.h),
              Text(review.productType, style: const TextStyle(fontSize: 14, color: Colors.black87)),
            ],
          ),
        ),
      ),
    );
  }

}
