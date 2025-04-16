import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/core/utils/app_colors.dart';
import 'package:team1_khayat/features/product/controllers/reviews_controller.dart';
import 'package:team1_khayat/features/product/models/base_product_model.dart';
import 'package:team1_khayat/features/product/views/widgets/rating_summary_widget.dart';
import 'package:team1_khayat/features/product/views/widgets/reviews_list.dart';
import 'package:team1_khayat/state_managment/app_status.dart';

class RatingReviewSection extends StatelessWidget {
    RatingReviewSection({super.key});
   final ReviewsController reviewsController = Get.find<ReviewsController>();


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          AppStrings.ratingAndReview.tr,
          style: AppTextStyles.textStyleBold34,
        ),
        SizedBox(
          height: 41.h,
        ),
         RatingSummaryWidget(rating: reviewsController.product.ratingsAverage, ratingCount: reviewsController.product.ratingsQuantity,),
        SizedBox(
          height: 34.h,
        ),
        Obx(
          () =>reviewsController.getReviewsState.value == AppState.success?Text('${reviewsController.reviews.length} reviews',
              style: AppTextStyles.textStyleBlack24
                  .copyWith(color: AppColors.blackColor)):const SizedBox(),
        ),
        SizedBox(
          height: 28.h,
        ),
         ReviewsList()
      ]),
    );
  }
}






