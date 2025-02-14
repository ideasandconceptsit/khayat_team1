import 'package:flutter/material.dart';
import '../../../../../core/app_style.dart';
import '../../widgets/social_buttons.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            "Or sign up With social account",
            style: AppStyle.textInLogin.copyWith(color: Colors.black),
          ),
        ),
        const SizedBox(height: 15),
        SocialButtons(),
      ],
    );
  }
}
