import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import '../../../../../core/utils/app_style.dart';
import '../../widgets/social_buttons.dart';

class SocialSignup extends StatelessWidget {
  const SocialSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            "social_sign_up".tr,
            style: AppStyle.textInLogin.copyWith(color: Colors.black),
          ),
        ),
         SizedBox(height: 12.h),
        SocialButtons(),
      ],
    );
  }
}
