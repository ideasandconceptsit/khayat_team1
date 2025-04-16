import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/features/main2/views/widget/view_all_accessories_view.dart';
import 'package:team1_khayat/shared/navigation_service.dart';

class SecondTitle extends StatelessWidget {
  const SecondTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 11.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.accessories.tr,
                style: AppTextStyles.tajawaltextStyle34,
              ),
              // SizedBox(height: 1.h),
              // Text(
              //   AppStrings.youveneverseenitbefore.tr,
              //   style: AppTextStyles.tajawaltextStyle14
              //       .copyWith(color: const Color(0xff9B9B9B)),
              // ),
            ],
          ),
          GestureDetector(
            onTap: () {
              NavigationService.navigateTo(AllAccessoriesView(),
                  arguments: null);
            },
            child: Text(
              AppStrings.viewAll.tr,
              style: AppTextStyles.tajawaltextStyle14.copyWith(decoration: TextDecoration.underline),
            ),
          ),
          //ItemList(),
        ],
      ),
    );
  }
}
