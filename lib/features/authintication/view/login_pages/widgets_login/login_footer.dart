import 'package:flutter/material.dart';
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
            "Or login With social account",
            style: AppStyle.textInLogin.copyWith(color: Colors.black),
          ),
        ),
        const SizedBox(height: 10),
        SocialButtons(),
        const SizedBox(height: 50),
      ],
    );
  }
}
