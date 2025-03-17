import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/features/profile/controller/review_controller.dart';
import 'package:team1_khayat/features/profile/view/widget/rating_bar_widget.dart';

class ReviewSummary extends StatelessWidget {
  final reviewController = Get.find<ReviewsController>();

  int getTotalRatings() {
    return reviewController.reviews.fold(0, (sum, review) => sum + review.ratings);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: RatingBarWidget()),
            SizedBox(width: 16.h),
            Text("Ratings ${getTotalRatings()}", style: AppTextStyles.tajawaltextStyle14),
          ],
        ));
  }
}
