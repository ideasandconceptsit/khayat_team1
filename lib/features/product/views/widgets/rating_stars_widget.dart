import 'package:flutter/material.dart';
import 'package:team1_khayat/core/app_colors.dart';

class RatingStarsWidget extends StatelessWidget {
  const RatingStarsWidget({super.key, required this.rating});
  final double rating;

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        for(int i=0;i<5;i++)
          rating.round()>i?const Icon(Icons.star,color: AppColors.yellowColor):const Icon(Icons.star_border,color: AppColors.greyColor,),
      ],
    );
  }
}