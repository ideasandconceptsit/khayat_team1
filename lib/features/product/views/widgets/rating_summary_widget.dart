import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:team1_khayat/core/app_colors.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/features/product/views/widgets/star_rating_chart.dart';

class RatingSummaryWidget extends StatelessWidget {
  const RatingSummaryWidget({super.key, required this.rating, required this.ratingCount});
  final double rating;
  final int ratingCount;

  @override
  Widget build(BuildContext context) {
    return  Row(
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
              '$ratingCount ratings',
              style: AppTextStyles.textStyleRegular14.copyWith(color: AppColors.greyColor),
            )


          ],

        ),
        SizedBox(width: 33.w,),
        const Expanded(child: StarRatingChart(ratingCount: [20,10,3,6,6],))
      ],
    );
  }
}


