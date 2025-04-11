import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_colors.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/features/product/controllers/reviews_controller.dart';
import 'package:team1_khayat/features/product/views/widgets/rating_stars_widget.dart';
import 'package:team1_khayat/shared/custom_app_button/custom_app_button.dart';
import 'package:team1_khayat/state_managment/app_status.dart';


class WriteReviewBottomSheetWidget extends StatelessWidget {
  const WriteReviewBottomSheetWidget({super.key,});



  @override
  Widget build(BuildContext context) {
    final ReviewsController reviewsController=Get.find<ReviewsController>();
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(AppStrings.whatIsYouRate.tr,style: AppTextStyles.textStyleBlack18,),
        SizedBox(height: 26.h,),
        Center(child:  Obx(() =>  RatingStarsWidget(rating: reviewsController.rating.value.toDouble(),starsSize: 40.w,space: 12.w,onTap: reviewsController.changeRating,))),
        SizedBox(height: 34.h,),
        Text(textAlign: TextAlign.center,AppStrings.pleaseShareYourOpinion.tr,style: AppTextStyles.textStyleBlack18,),
        SizedBox(height: 18.h,),
        Container(
          height: 148.h,
          decoration: ShapeDecoration(
            color: AppColors.whiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          child: TextField(
            controller: reviewsController.reviewTextController,
              maxLines: null,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(
                  8.0.h,
                ),
              )),
        ),
        const Spacer(),
        Obx(() => CustomAppButton(isLoading: reviewsController.addReviewState.value == AppState.loading,text: AppStrings.sendReview.tr,height: 48.h,onTap: ()=>reviewsController.addReviewToProduct(),)),
        SizedBox(height: 12.h,)

      ],
    );
  }
}