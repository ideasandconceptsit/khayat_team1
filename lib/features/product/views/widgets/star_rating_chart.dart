import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:team1_khayat/core/app_colors.dart';
import 'package:team1_khayat/core/app_styles.dart';

class StarRatingChart extends StatefulWidget {
  final List<int> ratingCount;

  const StarRatingChart({super.key, required this.ratingCount});

  @override
  State<StarRatingChart> createState() => _StarRatingChartState();
}

class _StarRatingChartState extends State<StarRatingChart> {
  late int maxRating;
  @override
  void initState() {
    maxRating = widget.ratingCount.reduce((a, b) => a > b ? a : b);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {


    return Column(
        children: List.generate(5, (index) {
          int maxRating = widget.ratingCount.reduce((a, b) => a > b ? a : b);
          double barWidth = (widget.ratingCount[index] / maxRating) * 125;
          return Row(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: List.generate(
                    5-index,
                        (index) =>  Icon(Icons.star, color: Colors.amber, size: 13.h),
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 8.h,
                      width: barWidth,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10.w,),
              Text(
                "${widget.ratingCount[index]}",
                style: AppTextStyles.textStyleRegular14.copyWith(color: AppColors.blackColor),
              )
            ],
          );
        },)
    );
  }
}
