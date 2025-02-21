import 'package:flutter/cupertino.dart';
import 'package:team1_khayat/core/app_styles.dart';

class HeaderSection extends StatelessWidget {
  HeaderSection(
      {super.key, required this.text});
  final String text;

  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Text(
          text,
          style: AppTextStyles.tajawaltextStyle34,
        );
  }
}
