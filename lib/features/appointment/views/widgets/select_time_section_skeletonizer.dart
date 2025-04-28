import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:team1_khayat/core/utils/app_colors.dart';

class SelectTimeSectionSkeletonizer extends StatelessWidget {
  const SelectTimeSectionSkeletonizer({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: SizedBox(
        height: 125.h,
        child: GridView.builder(
          padding: EdgeInsets.all(10.w),
          itemCount: 8,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 16.w,
            mainAxisSpacing: 12.h,
            childAspectRatio: 2.5,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(
                    color: AppColors.greyColor,
                    width: .4.w,
                  ),
                ),
                child: const Text(
                  "time",
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  String formatTime(String isoString) {
    DateTime dateTime = DateTime.parse(isoString).toLocal();
    return DateFormat.jm().format(dateTime); // "9:30 AM"
  }
}