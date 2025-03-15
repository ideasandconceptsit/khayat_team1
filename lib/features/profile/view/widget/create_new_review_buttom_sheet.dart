import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/shared/app_buttons/app_buttons.dart';
import 'package:team1_khayat/shared/app_snakbar/app_snackbar.dart';
import 'package:team1_khayat/shared/custom_form_field/csutom_form_field.dart';

class CreateNewReviewBottomSheet extends StatelessWidget {
  final void Function()? onTap;
  final TextEditingController reviewController = TextEditingController();
  final RxInt selectedRating = 0.obs;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  CreateNewReviewBottomSheet({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'أضف مراجعتك',
                style: AppTextStyles.tajawaltextStyle18,
              ),
            ),
            SizedBox(height: 18.h),

            CustomFormField(
              hintText: "اكتب مراجعتك هنا...",
              controller: reviewController,
              maxLines: 10,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "يرجى إدخال المراجعة";
                }
                return null;
              },
            ),
            SizedBox(height: 17.h),

            Text("التقييم:", style: AppTextStyles.tajawaltextStyle16),
            SizedBox(height: 8.h),
            Obx(
              () => Row(
                children: List.generate(5, (index) {
                  int star = index + 1;
                  return IconButton(
                    onPressed: () => selectedRating.value = star,
                    icon: Icon(
                      Icons.star,
                      color: star <= selectedRating.value ? Colors.amber : Colors.grey,
                      size: 32.w,
                    ),
                  );
                }),
              ),
            ),
            SizedBox(height: 24.h),

            DefaultButton(
              text: 'إرسال المراجعة',
              press: () {
                if (!_formKey.currentState!.validate()) {
                  return;
                }

                if (selectedRating.value == 0) {
                  SnackbarHelper.showErrorSnackbar("يرجى اختيار التقييم!");
                  return;
                }

                Get.back(); 
                SnackbarHelper.showSuccessSnackbar("تم إرسال المراجعة بنجاح!");
              },
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
