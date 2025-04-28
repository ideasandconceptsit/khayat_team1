import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/utils/app_colors.dart';

import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/features/product/views/widgets/write_review_bottom_sheet_widget.dart';
import 'package:team1_khayat/shared/app_bottom_sheet/app_bottom_sheet.dart';
import 'package:team1_khayat/shared/custom_app_button/custom_app_button.dart';

class WriteReviewFAB extends StatelessWidget {
  const WriteReviewFAB({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return  CustomAppButton(
      onTap: (){
        showCustomAppBottomSheet(context,child: const WriteReviewBottomSheetWidget(),height: 640.h);
      },
      text: "",
      width: 128.w,
      widget: Padding(
        padding:  EdgeInsets.all(8.h,),
        child: Row(
          children: [
             Icon(Icons.edit,color: AppColors.whiteColor,size: 14.w,),
            SizedBox(width: 8.w,),
            Text(AppStrings.writeAReview.tr,style: AppTextStyles.textStyleBlack12,),
          ],
        ),
      ),
    );
  }
}


