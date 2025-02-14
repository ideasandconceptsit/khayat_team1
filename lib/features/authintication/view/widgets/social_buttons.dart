import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSocialButton("assets/google-icon-2048x2048-pks9lbdv.png"),
            SizedBox(width: 16.w),
            _buildSocialButton("assets/124010.png"),
          ],
        );
  }

  Widget _buildSocialButton(String imagePath) {
    return Container(
      height: 64,
      width: 92,
      padding:const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: Colors.white),
      ),
      child: Center(
        child: Image.asset(
          imagePath,
          width: 24.w,
          height: 24.h,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
