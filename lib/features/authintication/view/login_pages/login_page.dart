import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/features/authintication/auth_controllers/login_controller.dart';
import 'package:team1_khayat/features/authintication/view/login_pages/widgets_login/login_appbar.dart';
import 'package:team1_khayat/features/authintication/view/login_pages/widgets_login/login_buttons.dart';
import 'package:team1_khayat/features/authintication/view/login_pages/widgets_login/login_footer.dart';
import 'package:team1_khayat/features/authintication/view/login_pages/widgets_login/login_form.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/app_style.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: buildLoginAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('login'.tr, style: AppStyle.navBar),
                 SizedBox(height: 97.h),
                LoginForm(controller: controller),
                 SizedBox(height: 11.h),
                LoginButtons(controller: controller),
                 SizedBox(height: 125.h),
                const LoginFooter(),
               // Center(child: buildHomeIndicator()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
