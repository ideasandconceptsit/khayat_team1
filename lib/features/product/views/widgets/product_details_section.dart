import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_colors.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/features/product/controllers/product_controller.dart';
import 'package:team1_khayat/features/product/models/base_product_model.dart';
import 'package:team1_khayat/features/product/views/widgets/rating_stars_widget.dart';

class ProductDetailsSection extends StatelessWidget {
   ProductDetailsSection({super.key});

  final ProductCardController productCardController = Get.find();


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
                productCardController.product.name,
                style: AppTextStyles.textStyleBlack24.copyWith(color: AppColors.blackColor),
              ),
              const Spacer(),
              Text(
                productCardController.product.price.toString(),
                style: AppTextStyles.textStyleBlack24.copyWith(color: AppColors.blackColor),
              )
            ],
          ),
          Text(
            productCardController.product.name,
            style: AppTextStyles.textStyleRegular11.copyWith(color: AppColors.greyColor),
          ),
           RatingStarsAndCountWidget(ratingAverage: productCardController.product.ratingsAverage,ratingCount: productCardController.product.ratingsQuantity,),
          SizedBox(height: 20.h,),
           Text(
             ("${productCardController.product.name} ")*20,
            maxLines: 6,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.textStyleRegular14.copyWith(color: AppColors.blackColor),
          ),

        ],
      ),

    );
  }
}

class RatingStarsAndCountWidget extends StatelessWidget {
  const RatingStarsAndCountWidget({super.key, required this.ratingAverage, required this.ratingCount});
  final double ratingAverage;
  final int ratingCount;

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
          RatingStarsWidget(rating: ratingAverage),
         Text(
          '($ratingCount)',
          style: AppTextStyles.textStyleRegular11.copyWith(color:AppColors.greyColor),
        )
      ],
    );
  }
}
