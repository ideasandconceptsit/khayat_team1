import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/shared/custom_app_button/custom_app_button.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Shopping Bags Image
              Image.asset(
                'assets/images/success.png',
                height: 200.h,
                width: 200.w,
              ),
              SizedBox(height: 24.h),
              // Success Title
              Text(
                'success'.tr + '!',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12.h),
              // Success Message
              Text(
                'address_saved_successfully'.tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Tajawal',
                  fontSize: 14.sp,
                  color: Colors.grey[600],
                ),
              ),
              Text(
                'thank_you'.tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Tajawal',
                  fontSize: 14.sp,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 32.h),
              // Continue Button
              CustomAppButton(
                text: 'continue'.tr,
                onTap: () => Get.back(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
