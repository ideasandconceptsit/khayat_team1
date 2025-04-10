import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_colors.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/features/product/views/widgets/product_details_section.dart';
import 'package:team1_khayat/features/product/views/widgets/size_color_and_favourite_row.dart';
import 'package:team1_khayat/shared/custom_app_button/custom_app_button.dart';
import 'package:team1_khayat/shared/custom_cached_network_image/custom_cached_network_image.dart';

import 'images_list_section.dart';

class ProductCardBody extends StatelessWidget {
  const ProductCardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return   Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const ImagesListSection(),
                const SizeColorAndFavouriteRow(),
                SizedBox(height: 10.h,),
                const ProductDetailsSection(),
                SizedBox(height: 20.h,),

              ],
            ),
          ),
        ),
        Container(
          color: AppColors.whiteColor,
          child: CustomAppButton(text: AppStrings.addToCart.tr,),
        ),
      ]

    );
  }
}








