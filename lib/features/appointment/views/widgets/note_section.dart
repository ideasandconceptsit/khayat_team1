import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/core/utils/app_colors.dart';
import 'package:team1_khayat/features/appointment/controllers/appointment_controller.dart';

class NoteSection extends StatelessWidget {
   NoteSection({super.key});
  final AppointmentController controller = Get.find<AppointmentController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Form(
        key: controller.noteFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppStrings.note.tr,
                style: AppTextStyles.textStyleMedium16),
            Container(
              height: 88.h,
              decoration: _buildShapeDecoration(),
              child: TextFormField(
                controller: controller.noteController,
                  validator: (value) => value!.isEmpty ? AppStrings.pleaseEnterNote.tr : null,
                  maxLines: null,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(
                      8.0.h,
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }

  ShapeDecoration _buildShapeDecoration() {
    return ShapeDecoration(
              color: AppColors.lightGrey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            );
  }
}