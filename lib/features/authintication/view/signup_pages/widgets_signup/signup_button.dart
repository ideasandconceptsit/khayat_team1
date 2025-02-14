import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../state_managment/app_routers.dart';
import '../../widgets/custom_button.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: "SIGN UP",
      onPressed: () => Get.toNamed(Routes.verificationPage),
    );
  }
}
