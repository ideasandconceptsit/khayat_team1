import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:team1_khayat/core/app_colors.dart';

// This widget is designed to be used in all places with a BottomSheet,
// fully prepared and customizable – just add the elements you want to display.
// it accepts a single child, but if you need more than one, you can wrap them in a Column. (just to be more customizable)

void showCustomAppBottomSheet(BuildContext context,
    {double? height, EdgeInsetsGeometry? contentPadding, Widget? child}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
    ),
    builder: (context) {
      return Container(
        padding: contentPadding ?? EdgeInsets.symmetric(horizontal: 16.w),
        height: height ??MediaQuery.sizeOf(context).height/2,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.scaffoldBackgroundColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        ),
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 14.h, bottom: 32.h),
                child: Container(
                  width: 60.w,
                  height: 6.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3.r),
                    color: AppColors.greyColor,
                  ),
                ),
              ),
            ),
            Expanded(child: child ?? const SizedBox.shrink())
          ],
        ),
      );
    },
  );
}