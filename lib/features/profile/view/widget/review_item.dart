import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_assets.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/features/profile/model/review_model.dart';
import 'package:team1_khayat/features/profile/view/widget/custom_circle_avatar.dart';

class ReviewItem extends StatelessWidget {
  final ReviewModel review;
  const ReviewItem({super.key, required this.review});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Stack(
         clipBehavior: Clip.none,
        children: [
           Card(
             clipBehavior: Clip.none,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(review.user.name,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(width: 10.h),
                Row(
                  children: [
                    Row(
                      children: List.generate(
                        review.ratings,
                        (index) =>
                            const Icon(Icons.star, color: Colors.amber, size: 20),
                      )..addAll(
                          List.generate(
                              5 - review.ratings,
                              (index) => const Icon(Icons.star,
                                  color: Colors.grey, size: 20)),
                        ),
                    ),
                    const Spacer(),
                    Text(review.createdAt.toString().split(' ')[0],
                        style: const TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
                SizedBox(height: 11.h),
                Text(review.review, style: AppTextStyles.tajawaltextStyle14),
                SizedBox(height: 20.h),
                Text(
                  "${AppStrings.productName.tr}: ${review.productType}",
                  style: AppTextStyles.tajawaltextStyle16
                ),
              ],
            ),
          ),
        ),
        Positioned(
           top:-27 ,
          child:CustomCircleAvatar(path:AppAssets.imagetest ,size: 40,),
),
SizedBox(width: 8.h),
        ],
      ),
    );
  }
}
