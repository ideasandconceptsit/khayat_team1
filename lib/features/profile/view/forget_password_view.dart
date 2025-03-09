import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/features/profile/controller/forget_password_controller.dart';
import 'package:team1_khayat/features/profile/repos/forget_password_repository.dart';
import 'package:team1_khayat/features/profile/view/verification_view.dart';
import 'package:team1_khayat/shared/custom_app_bar/custom_app_bar.dart';
import 'package:team1_khayat/shared/custom_app_button/custom_app_button.dart';
import 'package:team1_khayat/shared/custom_form_field/email_form_field.dart';

class ForgotPasswordView extends StatelessWidget {
  ForgotPasswordView({super.key});

  final forgetPasswordController =
      Get.put(ForgetPasswordController(ForgetPasswordRepository()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        arrowBackVisibility: true,
        arrowBackOnPressed: () {
          Get.back();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Text(
                    AppStrings.forgotpassword.tr,
                    style: AppTextStyles.tajawaltextStyle34,
                  ),
                  SizedBox(height: 58.h),
                  Center(
                    child: Text(
                      AppStrings.pleaseenterYourEmail.tr,
                      style: AppTextStyles.tajawaltextStyle14.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 58.h),
                  Form(
                    key: forgetPasswordController.formKeypassword,
                    child: EmailFormField(
                      controller: forgetPasswordController.emailController,
                      hintText: AppStrings.email.tr,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'يرجى إدخال البريد الإلكتروني';
                        } else if (!GetUtils.isEmail(value)) {
                          return 'يرجى إدخال بريد إلكتروني صحيح';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 22.h),
                  Obx(() {
                    return Column(
                      children: [
                        CustomAppButton(
                          text: forgetPasswordController.isLoading.value
                              ? "جاري الإرسال..."
                              : AppStrings.send.tr,
                          height: 48.h,
                          onTap: () async {
                            if (forgetPasswordController
                                .formKeypassword.currentState!
                                .validate()) {
                             await forgetPasswordController.forgetPassword(email: forgetPasswordController.emailController.text);

                              if (forgetPasswordController.errorMessage.value.isEmpty) {
                                Get.to(() => const VerificationView());
                              }
                            }
                          },
                        ),
                        SizedBox(height: 10.h),
                        if (forgetPasswordController.errorMessage.isNotEmpty)
                          Text(
                            forgetPasswordController.errorMessage.value,
                            style: const TextStyle(
                              color: Colors.red,
                            ),
                          ),
                      ],
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
