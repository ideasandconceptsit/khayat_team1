import 'package:flutter/material.dart';
import 'package:team1_khayat/core/utils/app_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.onPressed});
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child:  Container(
      decoration: BoxDecoration(
        color: const Color(0xff219653),
        borderRadius: BorderRadius.circular(5),
        boxShadow: const [
          BoxShadow(
            color: Color(0xffD32626),
            spreadRadius: 0,
            blurRadius: 1,
            offset: Offset(0, 1),
          ),
        ],
      ),
      width: double.infinity,
      height: 50,
      child: Center(
        child: Text(text, style: AppStyle.textButton),
      ),
      // child: const CustomButton(),
        ));
  }
}
