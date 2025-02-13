import 'package:flutter/material.dart';
import 'package:team1_khayat/core/utils/app_colors.dart';
import 'package:team1_khayat/core/utils/app_text_style.dart';

class ProfileOption extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  ProfileOption({required this.title, required this.subtitle, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            title,
            style: AppStyles.tajawaltextStyle16.copyWith(
              color: AppColors.grey
            ),
          ),
          subtitle: Text(
            subtitle,
            style: AppStyles.tajawaltextStyle11,
          ),
          trailing: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
          onTap: onTap,
        ),
        Divider(color: AppColors.black1),
      ],
    );
  }
}