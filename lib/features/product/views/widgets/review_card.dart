import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:team1_khayat/core/app_colors.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/features/product/models/review_model.dart';
import 'package:team1_khayat/features/product/views/widgets/helpfull_row.dart';
import 'package:team1_khayat/features/product/views/widgets/rating_and_date_row.dart';
import 'package:team1_khayat/shared/custom_cached_network_image/custom_cached_network_image.dart';
import 'package:team1_khayat/shared/custom_card_with_shadow/custom_card_with_shadow.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key, required this.reviewModel});
  final ReviewModel reviewModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomCardWithShadow(
              padding: EdgeInsetsDirectional.only(
                  top: 24.h, start: 14.w, bottom: 14.h, end: 15.w),
              width: double.infinity,
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    reviewModel.user.name,
                    style: AppTextStyles.textStyleBlack14,
                  ),
                   RatingAndDateRow(rating:  reviewModel.ratings,date:  reviewModel.createdAt,),
                  SizedBox(height: 10.h,),
                  Text(
                    reviewModel.review,
                    style: AppTextStyles.textStyleRegular14.copyWith(color: AppColors.blackColor),
                  ),
                  SizedBox(height: 10.h,),
                  const HelpfullRow()
                ],

              )),
        ),
        CustomCachedNetworkImage(
            circularBorderRadius: 50.w,
            imageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjDGMp734S91sDuUFqL51_xRTXS15iiRoHew&s",
            height: 32.w,
            width: 32.w),
      ],
    );
  }
}