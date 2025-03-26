import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/app_style.dart';
import '../../widgets/social_buttons.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Center(
          child: Text(
            "social_login".tr,
            style: AppStyle.textInLogin.copyWith(color: Colors.black),
          ),
        ),
         SizedBox(height: 12.h),
        SocialButtons(),
        const SizedBox(height: 50),
      ],
    );
  }
}
