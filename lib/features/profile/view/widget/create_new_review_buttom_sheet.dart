import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_strings.dart';
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              AppStrings.whatIsYourRate.tr,
              style: AppTextStyles.tajawaltextStyle18,
            ),
            SizedBox(height: 18.h),
            Obx(
              () => Wrap(
                spacing: 8.w,
                children: List.generate(5, (index) {
                  int star = index + 1;
                  return GestureDetector(
                    onTap: () => reviewsController.selectedRating.value = star,
                    child: Icon(
                      Icons.star,
                      color: star <= reviewsController.selectedRating.value ? Colors.amber : Colors.grey,
                      size: 32.w,
                    ),
                  );
                }),
              ),
            ),
            SizedBox(height: 34.h),
            Align(
              alignment: Alignment.center,
              child: Text(
                AppStrings.pleaseShareYourOpinionaboutTheProduct.tr,
                textAlign: TextAlign.center,
                style: AppTextStyles.tajawaltextStyle18,
              ),
            ),
            SizedBox(height: 18.h),
            CustomFormField(
              hintText: AppStrings.yourReview.tr,
              controller: reviewsController.reviewController,
              maxLines: 10,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "يرجى إدخال المراجعة";
                }
                return null;
              },
            ),
            SizedBox(height: 17.h),
            Obx(
              () => DefaultButton(
                text: reviewsController.isLoading.value ? "جاري الإرسال..." : AppStrings.sendReview.tr,
                press: () async {
                  if (!_formKey.currentState!.validate()) return;

                  if (reviewsController.selectedRating.value == 0) {
                    SnackbarHelper.showErrorSnackbar("يرجى اختيار التقييم!");
                    return;
                  }

                  reviewsController.isLoading.value = true;
                  bool success = await reviewsController.addReview(
                    userId: userId,
                    productId: productId,
                    productType: productType,
                  );
                  reviewsController.isLoading.value = false;

                  if (success) {
                    Get.back();
                    SnackbarHelper.showSuccessSnackbar("تم إرسال المراجعة بنجاح!");
                  } else {
                    SnackbarHelper.showErrorSnackbar("حدث خطأ أثناء إرسال المراجعة، حاول مرة أخرى.");
                  }
                },
              ),
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
