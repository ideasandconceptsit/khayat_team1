import 'package:flutter/cupertino.dart';
import 'package:team1_khayat/core/utils/app_text_style.dart';

class HeaderSection extends StatelessWidget {
  HeaderSection(
      {super.key, required this.text});
  final String text;

  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Text(
          text,
          style: AppStyles.tajawaltextStyle34,
        );
  }
}
