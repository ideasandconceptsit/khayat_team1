import 'package:flutter/material.dart';

class SocialButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSocialButton("assets/google-icon-2048x2048-pks9lbdv.png"),
          const  SizedBox(width: 20),
            _buildSocialButton("assets/124010.png"),
          ],
        );
  }

  Widget _buildSocialButton(String imagePath) {
    return Container(
      height: 64,
      width: 92,
      padding:const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white),
      ),
      child: Center(
        child: Image.asset(
          imagePath,
          width: 24,
          height: 24,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
