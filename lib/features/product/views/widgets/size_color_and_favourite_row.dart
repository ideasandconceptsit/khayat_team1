import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/features/product/views/widgets/color_drop_menu.dart';
import 'package:team1_khayat/shared/custom_mini_circle_button/custom_mini_circle_button.dart';

class SizeColorAndFavouriteRow extends StatelessWidget {
  const SizeColorAndFavouriteRow({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.0.w,vertical: 12.h),
      child: Row(
        children: [
          const Expanded(child: CustomDropMenu(title: "Medium", values: ['Medium','Large','Small'],)),
          SizedBox(width: 16.w,),
          const Expanded(child: CustomDropMenu(title: "Black", values: ['Black','Red','Blue'],)),
          SizedBox(width: 16.w,),
           CustomMiniCircleButton(icon: Icons.favorite_border,onTap: (){},)

        ],
      ),
    );
  }
}