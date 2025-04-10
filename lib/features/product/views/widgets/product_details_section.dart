import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:team1_khayat/core/app_colors.dart';
import 'package:team1_khayat/core/app_styles.dart';

class ProductDetailsSection extends StatelessWidget {
  const ProductDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'H&M',
                style: AppTextStyles.textStyleBlack24.copyWith(color: AppColors.blackColor),
              ),
              const Spacer(),
              Text(
                '\$19.99',
                style: AppTextStyles.textStyleBlack24.copyWith(color: AppColors.blackColor),
              )
            ],
          ),
          Text(
            'Short black dress',
            style: AppTextStyles.textStyleRegular11.copyWith(color: AppColors.greyColor),
          ),
          const RatingStarsWidget(ratingAverage: 1.9,ratingCount: 10,),
          SizedBox(height: 20.h,),
           Text(
            'Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.',
            style: AppTextStyles.textStyleRegular14.copyWith(color: AppColors.blackColor),
          ),

        ],
      ),

    );
  }
}

class RatingStarsWidget extends StatelessWidget {
  const RatingStarsWidget({super.key, required this.ratingAverage, required this.ratingCount});
  final double ratingAverage;
  final int ratingCount;

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        for(int i=0;i<5;i++)
          ratingAverage.round()>i?const Icon(Icons.star,color: AppColors.yellowColor):const Icon(Icons.star_border,color: AppColors.greyColor,),
         Text(
          '($ratingCount)',
          style: AppTextStyles.textStyleRegular11.copyWith(color:AppColors.greyColor),
        )
      ],
    );
  }
}
