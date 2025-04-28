import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:team1_khayat/core/utils/app_colors.dart';


class RatingStarsWidget extends StatelessWidget {
  const RatingStarsWidget({super.key, required this.rating, this.starsSize,this.space, this.onTap});
  final double rating;
  final double? starsSize;
  final double? space;
  final void Function(int)? onTap;


  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for(int i=0;i<5;i++)
          InkWell(onTap: onTap==null?null:()=>onTap!(i+1),
              child: Padding(padding: EdgeInsetsDirectional.symmetric(horizontal:  space??2.w),child: rating.round()>i? Icon(Icons.star,color: AppColors.yellowColor,size: starsSize??12.w,): Icon(Icons.star_border,color: AppColors.greyColor,size: starsSize??13.w,),))
      ],
    );
  }
}