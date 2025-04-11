import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:team1_khayat/core/app_colors.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/features/product/views/widgets/rating_stars_widget.dart';

class RatingAndDateRow extends StatelessWidget {
  const RatingAndDateRow({
    super.key, required this.rating, required this.date,
  });
  final int rating;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         RatingStarsWidget(rating: rating.toDouble()),
        const Spacer(),
        Text(
            DateFormat('MMMM d, y').format(date),
            style: AppTextStyles.textStyleRegular11.copyWith(color: AppColors.greyColor)
        ),
      ],
    );
  }
}