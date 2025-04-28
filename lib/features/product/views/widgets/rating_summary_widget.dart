import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/utils/app_colors.dart';

import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/features/product/controllers/product_controller.dart';
import 'package:team1_khayat/features/product/controllers/reviews_controller.dart';
import 'package:team1_khayat/features/product/views/widgets/star_rating_chart.dart';
import 'package:team1_khayat/state_managment/app_status.dart';

class RatingSummaryWidget extends StatelessWidget {
  const RatingSummaryWidget(
      {super.key, required this.rating, required this.ratingCount});

  final double rating;
  final int ratingCount;

  @override
  Widget build(BuildContext context) {
    final ReviewsController reviewsController = Get.find();
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Text(
              '$rating',
              style: AppTextStyles.textStyleBlack44,
            ),
            Text(
              '$ratingCount ${AppStrings.ratings}',
              style: AppTextStyles.textStyleRegular14
                  .copyWith(color: AppColors.greyColor),
            )
          ],
        ),
        SizedBox(
          width: 33.w,
        ),
         Obx(
        () =>  reviewsController.getReviewsState.value == AppState.success?Expanded(
              child:   StarRatingChart(
                          ratingCount: reviewsController.productRatings,
                        ),
              ):const SizedBox(),
         )
      ],
    );
  }

}


