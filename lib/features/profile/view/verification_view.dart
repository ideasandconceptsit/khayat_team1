import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/features/profile/controller/verification_controller.dart';
import 'package:team1_khayat/features/profile/repos/verfication_repository.dart';
import 'package:team1_khayat/features/profile/view/widget/Build_password_change_widget.dart';
import 'package:team1_khayat/shared/app_bottom_sheet/app_bottom_sheet.dart';
import 'package:team1_khayat/shared/custom_app_button/custom_app_button.dart';
import 'package:team1_khayat/shared/custom_form_field/csutom_form_field.dart';

class VerificationView extends StatelessWidget {
  VerificationView({super.key});

  final _verificationController =
      Get.put(VerificationResetCodeController(VerificationRepository()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Form(
          key: _verificationController.formKeyVerifayCode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.verification.tr,
                style: AppTextStyles.tajawaltextStyle34,
              ),
              SizedBox(height: 175.h),
              CustomFormField(
                hintText: 'OTP',
                controller: _verificationController.otpController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يرجى إدخال رمز OTP';
                  }
                  return null;
                },
              ),
              SizedBox(height: 44.h),
              Obx(() {
                return Column(
                  children: [
                    CustomAppButton(
                        text: _verificationController.isLoading.value
                            ? " جاري التحقق..."
                            : AppStrings.next.tr,
                        height: 48.h,
                        onTap: () async {
                          if (_verificationController
                              .formKeyVerifayCode.currentState!
                              .validate()) {
                            await _verificationController.verificationRestCode(
                              resetCode:
                                  _verificationController.otpController.text,
                            );

                            if (_verificationController
                                .errorMessage.value.isEmpty) {
                              showCustomAppBottomSheet(
                                
                                context,
                                height:
                                    MediaQuery.of(context).size.height * 0.7,
                                child: PasswordChangeWidget(),
                              );
                            } else {}
                          }
                        }),
                    SizedBox(height: 10.h),
                    if (_verificationController.errorMessage.isNotEmpty)
                      Text(
                        _verificationController.errorMessage.value,
                        style: const TextStyle(color: Colors.red),
                      ),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
