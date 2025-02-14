import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/features/authintication/auth_controllers/login_controller.dart';
import 'package:team1_khayat/features/authintication/view/login_pages/widgets_login/login_appbar.dart';
import 'package:team1_khayat/features/authintication/view/login_pages/widgets_login/login_buttons.dart';
import 'package:team1_khayat/features/authintication/view/login_pages/widgets_login/login_footer.dart';
import 'package:team1_khayat/features/authintication/view/login_pages/widgets_login/login_form.dart';
import '../../../../core/app_colors.dart';
import '../../../../core/app_style.dart';
import '../widgets/ndicator_widget.dart';

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
                Text('Login'.tr, style: AppStyle.navBar),
                const SizedBox(height: 90),
                LoginForm(controller: controller), // استدعاء الفورم
                const SizedBox(height: 20),
                LoginButtons(controller: controller), // استدعاء الأزرار
              ],
            ),
            const SizedBox(height: 130),
           const LoginFooter(),
            Center(child: buildHomeIndicator()),
          ],
        ),
      ),
    );
  }
}
