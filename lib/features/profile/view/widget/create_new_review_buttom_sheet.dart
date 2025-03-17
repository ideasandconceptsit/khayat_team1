import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/features/profile/controller/review_controller.dart';
import 'package:team1_khayat/shared/app_buttons/app_buttons.dart';
import 'package:team1_khayat/shared/app_snakbar/app_snackbar.dart';
import 'package:team1_khayat/shared/custom_form_field/csutom_form_field.dart';

class CreateNewReviewBottomSheet extends StatelessWidget {
  final ReviewsController reviewsController = Get.find();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final String userId;
  final String productId;
  final String productType;

  CreateNewReviewBottomSheet({
    super.key,
    required this.userId,
    required this.productId,
    required this.productType,
  });

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

            // حقل كتابة المراجعة
            CustomFormField(
              hintText: "اكتب مراجعتك هنا...",
              controller: reviewsController.reviewController,
              maxLines: 10,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "يرجى إدخال المراجعة";
                }
                return null;
              },
            ),
            SizedBox(height: 17.h),

            // مكون اختيار التقييم (نجوم)
            Text("التقييم:", style: AppTextStyles.tajawaltextStyle16),
            SizedBox(height: 8.h),
            Obx(
              () => Row(
                children: List.generate(5, (index) {
                  int star = index + 1;
                  return IconButton(
                    onPressed: () => reviewsController.selectedRating.value = star,
                    icon: Icon(
                      Icons.star,
                      color: star <= reviewsController.selectedRating.value ? Colors.amber : Colors.grey,
                      size: 32.w,
                    ),
                  );
                }),
              ),
            ),
            SizedBox(height: 24.h),

            // زر الإرسال
            DefaultButton(
              text: 'إرسال المراجعة',
              press: () async {
                if (!_formKey.currentState!.validate()) {
                  return;
                }

                if (reviewsController.selectedRating.value == 0) {
                  SnackbarHelper.showErrorSnackbar("يرجى اختيار التقييم!");
                  return;
                }

                // إرسال المراجعة
                bool success = await reviewsController.addReview(
                  userId: userId,
                  productId: productId,
                  productType: productType,
                  
                );

                if (success) {
                  Get.back(); // إغلاق الـ BottomSheet بعد الإرسال
                  SnackbarHelper.showSuccessSnackbar("تم إرسال المراجعة بنجاح!");
                } else {
                  SnackbarHelper.showErrorSnackbar("حدث خطأ أثناء إرسال المراجعة، حاول مرة أخرى.");
                }
              },
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
